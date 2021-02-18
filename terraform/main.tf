terraform {
  # Configure remote backend to store !STATE FILE! (sensitive informations)
  # We use Google Cloud Storage in this case
  backend "gcs" {
    bucket = "sandbox-305213-terraform" # Created bucket
    prefix = "/state/storybooks"
  }
}
