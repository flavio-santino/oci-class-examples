## Examples of OCI-CLI

1. Install OCI Command line on Oracle Linux

```
# sudo yum install python-oci-cli -y
# oci setup
```

2. Examples
   
```
# oci iam region list  --output table

# oci iam availability-domain list --compartment-id ocid1.compartment.oc1..aaaaaaaafc3xqsvobxzegt3brj4axpfdyduedvpjtffnskrz7kakfxn2qouq | jq -r .data[].name

# export C=ocid1.compartment.oc1..aaaaaaaafc3xqsvobxzegt3brj4axpfdyduedvpjtffnskrz7kakfxn2qouq

# oci iam availability-domain list -c $C --query "data [*].{ADs:\"name\"}" --output table

# oci compute image list -c $C --query "data [*].{ImageName:\"display-name\", OCID:id}"

# oci compute image list -c $C --query "data [*].{ImageName:\"display-name\", OCID:id}" --output table

# oci compute image list -c $C --query "data [?contains(\"display-name\", 'Oracle-Linux')].{ImageName:\"display-name\", OCID:id}" --output table

# oci network vcn create --generate-full-command-json-input > create-vcn.json

# cat create-vcn.json

{
  "cidrBlock": "192.168.0.0/16",
  "compartmentId": "ocid1.compartment.oc1..aaaaaaaafc3xqsvobxzegt3brj4axpfdyduedvpjtffnskrz7kakfxn2qouq",
  "displayName": "VCN01",
  "dnsLabel": "vcn01"
}

# oci network vcn create --from-json file://create-vcn.json

```

3. Different Profiles

```
[PHX]
user=ocid1.user.oc1..
fingerprint=d0:72:c4:a5:19:62:e2:af:f5:3f:7d:32:5d:ac:0d:3a
key_file=/home/opc/.oci/oci_api_key.pem
tenancy=ocid1.tenancy.oc1..
region=us-phoenix-1

[ASH]
user=ocid1.user.oc1..
fingerprint=d0:72:c4:a5:19:62:e2:af:f5:3f:7d:32:5d:ac:0d:3a
key_file=/home/opc/.oci/oci_api_key.pem
tenancy=ocid1.tenancy.oc1..
region=us-ashburn-1

```
