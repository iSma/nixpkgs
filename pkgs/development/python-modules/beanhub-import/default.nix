{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  pythonOlder,
  pytestCheckHook,
  beancount-black,
  beancount-parser,
  beanhub-extract,
  jinja2,
  poetry-core,
  pydantic,
  pytz,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "beanhub-import";
  version = "1.0.3";
  pyproject = true;

  disabled = pythonOlder "3.9";

  src = fetchFromGitHub {
    owner = "LaunchPlatform";
    repo = "beanhub-import";
    tag = version;
    hash = "sha256-6Y1gYAi8A6H0a0vj2avWxGS7hvjrvLBUS+LsgvY4sZo=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    beancount-black
    beancount-parser
    beanhub-extract
    jinja2
    pydantic
    pytz
    pyyaml
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "beanhub_import" ];

  meta = {
    description = "Declarative idempotent rule-based Beancount transaction import engine in Python";
    homepage = "https://github.com/LaunchPlatform/beanhub-import/";
    changelog = "https://github.com/LaunchPlatform/beanhub-import/releases/tag/${version}";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ fangpen ];
  };
}
