## Terraform code to build minimal UseGalaxy infrastructure on Openstack

## HOW TO RUN

1. Install terraform >= 1.43.0
2. run in your default dir `source <openstack_RC_file.sh>`
3. go inside `/infrastructure` if not yet done
4. check `vars.tf` and populate with your variables
5. `terraform init`
6. `terraform plan` or/then `terraform apply`
7. output will produce necessary IPs for next step

# UseGalaxy.eu Infrastructure [![Build Status](https://build.galaxyproject.eu/buildStatus/icon?job=usegalaxy-eu%2Finfrastructure)](https://build.galaxyproject.eu/job/usegalaxy-eu/job/infrastructure/)

**ACHTUNG** **ACHTUNG** **ACHTUNG**

- This is our actual infrastructure.
- Changes made here can be damaging.
- Be careful.
- Terraform catches some mistakes but not all

---

This infrastructure repo will run in Jenkins on cron, to ensure our infrastructure (Cloud VMs etc ...)
matches exactly what it should.

All changes should go through pull requests and never directly to master,
we will have the Jenkins bot comment on the PR with
the `terraform plan` output, allowing the admin to decide whether or not to
merge it.

## Layout/Theory

We're using this to manager every cloud resource. If it is something you would
do with the OpenStack API or UI, **do not do it.** Instead, use this repository
for it.

Our DNS provider is Amazon AWS/Route53 since they have a mostly reliable service
and a nice API.

All changes come in through PRs and are applied automatically by our [build server](https://build.galaxyproject.eu/job/usegalaxy-eu/job/infrastructure/). Sometimes jobs error there but it is normal.

### Variables

All important variables like flavour names, AWS Route53 zones, groups of
security groups for default things like webservices, etc. go in the variables
file.

```hcl
variable "vgcn_image" {
  default = "vggp-v31-j74-edc5aa3dc22c-master"
}
```

defines a variable and then you can use this with `${var.vgcn_image}`

### Instances

All instances are stored in files named `instance_<name>.tf`. Their structure is
not too complex:

```hcl
#        type of resource                 resource name
resource "openstack_compute_instance_v2" "apollo-usegalaxy" {
  # Server name in the OpenStack api. becomes the internal hostname with
  # .novalocal appended
  name            = "apollo.usegalaxy.eu"

  # We have several variables for you to choose from in the vars.tf file.
  image_name      = "${var.centos_image.name}"

  flavor_name     = "fl.ada.l"
  key_pair        = "cloud2"

  # You can define this as a list or use the var.sg_webservice for all of the
  # default security groups required for a webservice (egress, ufr ssh, public
  # ICMP, public http(s))
  security_groups = "${var.sg_webservice}"

  # Here we attach two networks:
  network {
    name = "bioinf"
  }

  network {
    name = "public"
  }
}

# Here we define a DNS record for this VM
resource "aws_route53_record" "apollo-usegalaxy" {
  # The zone needs to be correct for the TLD you want.
  zone_id = "${var.zone_usegalaxy_eu}"
  # The actual record
  name    = "apollo.usegalaxy.eu"
  type    = "A"
  ttl     = "7200"

  # Here we use a computed value from the first resource, format is from above:
  # "type of resource"."resource name".access_ip_v4
  records = ["${openstack_compute_instance_v2.apollo-usegalaxy.access_ip_v4}"]
}
```

When you run `make` terraform will sync, and if VMs need to be destroyed and
re-created, they will and DNS records will update appropriately.

## Commands

All infra IPs (without going to openstack.)

```console
$ ./bin/tfinfo-to-json.sh | jq -r '.openstack_compute_instance_v2 | keys[] as $k | [$k, .[$k]."network.0.fixed_ip_v4"] | @tsv'
```
