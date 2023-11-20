bring cloud;
bring util;
bring "@cdktf/provider-docker" as docker;
bring "@cdktf/provider-null" as nullProvider;
bring "@cdktf/provider-random" as randomProvider;

pub class MyCustomProviderResource {
  pub imageName: str;
  new() {
    new docker.provider.DockerProvider();
    new nullProvider.provider.NullProvider();
    new randomProvider.provider.RandomProvider();

    let randomString = new randomProvider.stringResource.StringResource(
      length: 10
    );

    let image = new docker.image.Image(
      name: "foo/bar",
    );

    let resource = new nullProvider.resource.Resource(triggers: { "changed": util.nanoid() });
    this.imageName = image.name;
  }
}


new MyCustomProviderResource();

test "foo" {
  log("hello");
}

test "bar" {
  log("hello");
}