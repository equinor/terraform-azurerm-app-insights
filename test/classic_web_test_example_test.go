package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestClassicWebTestExample(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/classic-web-test",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}
