provider "github" {
  token = var.token # or `GITHUB_TOKEN`
}

resource "github_repository" "code-repo" {
  name        = "static-pages-terraform"
  description = "Deploying static site on github pages using terraform"
  visibility  = "public"
  auto_init   = true

    pages {
    source {
      branch = "master"
      path   = "/"
    }
  }

  
}

resource "github_repository_file" "code-repo" {
  repository     = github_repository.code-repo.name
  branch         = "master"
  file           = "index.html"
  content        = file("./code/index.html")
  commit_message = "Added html"
#   commit_author  = "Terraform User"
}

resource "github_repository_file" "actions-workflow" {
  repository     = github_repository.code-repo.name
  branch         = "master"
  file           = ".github/workflows/actions.yml"
  content        = file("./code/actions.yml")
  commit_message = "Added workflow"
#   commit_author  = "Terraform User"
}



