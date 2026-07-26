do
  vim.filetype.add({
    pattern = {
      [".*/docker-compose.*%.ya?ml"] = "yaml.docker-compose",
      [".*/compose.*%.ya?ml"] = "yaml.docker-compose",
      [".*/%.gitlab-ci%.ya?ml"] = "yaml.gitlab",
      [".*/values.*%.ya?ml"] = "yaml.helm-values",
      [".*/helm/.*%.ya?ml"] = "yaml.helm-values",
    },
  })
end
