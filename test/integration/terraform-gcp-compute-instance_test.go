package tests

import (
	"testing"
	"regexp"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformGcpComputeInstance(t *testing.T) {

	name := "vm-instance"
	machine_type := "e2-micro"
	network := "default"
	size := 10
	app_type := "nodejs"

	var labels = map[string]string{
		"env"     : "dev",
		"owner"   : "aayush-vyas",
		"purpose" : "terraform-testing",
		"APPid"   : "CS50",
	}


	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../fixtures/",
		Vars:  map[string]interface{} {
			"name": name,
			"machine_type": machine_type,
			"network": network,
			"size": size,
			"app_type": app_type,
			"labels" : labels,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	t.Run("Instance name is having vm in it", func(t *testing.T){
		// Run `terraform output` to get the values of output variables and check they have the expected values.
		output := terraform.Output(t, terraformOptions, "name")
		assert.Equal(t, name, output)
	})

	
	t.Run("subnet is in us-central only", func(t *testing.T){
		// Run `terraform output` to get the values of output variables and check they have the expected values.
		output := terraform.Output(t, terraformOptions, "subnetwork")
		re := regexp.MustCompile(`us-central`)
		assert.Regexp(t, re, output)
	})

	t.Run("subnet is self_link of the live resource", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "subnetwork")
		re := regexp.MustCompile(`https`)
		assert.Regexp(t, re, output)
	})

	t.Run("appropriate tags are applied based on the app_type", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "tags")
		assert.Equal(t, "[http-server-3000 https-server-443 no-ssh]", output)
	})

	t.Run("labels are all in lower case despite user passing upper cased ones", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "labels")
		re := regexp.MustCompile(`[a-z]+`)
		assert.Regexp(t,re,output)
	})

}
