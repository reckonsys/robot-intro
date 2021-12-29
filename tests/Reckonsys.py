import os
from json import load

from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

dir_path = os.path.dirname(os.path.realpath(__file__))


class ReckRFError(Exception):
    pass


class AttrDict(dict):
    # box => dot
    # foo["item"] => foo.item
    def __getattr__(self, name):
        val = self[name]
        if isinstance(val, dict):
            return AttrDict(**val)
        return val


class PageObject:
    def __init__(self, filename):
        self.filepath = f"{dir_path}/pages/{filename}"
        with open(self.filepath) as _locators_file:
            locators = load(_locators_file)
            self.locators = AttrDict(**locators)

    def __getattr__(self, name):
        if name not in self.locators:
            raise Exception(f"locator '{name}' not found in '{self.filepath}'")
        return getattr(self.locators, name)


def get_var(var, required=True):
    value = BuiltIn().get_variable_value(f"${{{var}}}")
    if value is None and required is True:
        raise ReckRFError(f"Required variable not found: {var}")
    return value


class Reckonsys:
    @keyword
    def get_page_object(self, filename):
        return PageObject(filename=filename)
