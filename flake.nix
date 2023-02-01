{
  description = "A collection of flake templates";

  outputs = { self }: {

    templates = {

      pytorch-aarch64 = {
        path = ./aarch64/pytorch;
        description = "pytorch template using pipenv for aarch64-darwin";
      };
      
      pytorch-x86_64 = {
        path = ./x86_64/pytorch;
        description = "pytorch template using pipenv for x86_64";
      };

    };

    defaultTemplate = self.templates.pytorch-aarch64;

  };
}
