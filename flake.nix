{
  description = "A collection of flake templates";

  outputs = { self }: {

    templates = {
      python-aarch64 = {
        path = ./aarch64/python;
        description = "python template using python 3.11 and pipenv for aarch64-darwin";
      };

      pytorch-aarch64 = {
        path = ./aarch64/pytorch;
        description = "pytorch template using python 3.10 and pipenv for aarch64-darwin";
      };
      
      pytorch-x86_64 = {
        path = ./x86_64/pytorch;
        description = "pytorch template using python 3.10 and pipenv for x86_64";
      };

    };

    defaultTemplate = self.templates.pytorch-aarch64;

  };
}
