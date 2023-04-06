{
  description = "A collection of flake templates";

  outputs = { self }: {

    templates = {
      latex = {
        path = ./all/latex;
        description = "latex template that builds with pdflatex";
        welcomeText = "Change the 'name' parameter in the inputs of flake.tex to point to your latex document";
      };
      
      generic = {
        path = ./all/generic;
        description = "Generic template for adding packages to environment";
        welcomeText = "Change the <change this> text to add packages";
      };
      
      python-project = {
        path = ./all/python_project;
        description = "python project for all systems";
        welcomeText = "Change the project_name text to your project name";
      };

      python-aarch64 = {
        path = ./aarch64-darwin/python;
        description = "python template using python 3.11 and pipenv for aarch64-darwin";
      };
      
      python-aarch64 = {
        path = ./aarch64-darwin/python_project;
        description = "python project for aarch64-darwin systems";
        welcomeText = "Change the project_name text to your project name";
      };

      pytorch-aarch64 = {
        path = ./aarch64-darwin/pytorch;
        description = "pytorch template using python 3.10 and pipenv for aarch64-darwin";
      };
      
      pytorch-x86_64 = {
        path = ./x86_64-darwin/pytorch;
        description = "pytorch template using python 3.10 and pipenv for x86_64";
      };

    };

    defaultTemplate = self.templates.pytorch-aarch64;

  };
}
