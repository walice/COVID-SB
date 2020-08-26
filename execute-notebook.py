#!/usr/bin/env python3

import papermill as pm
import os

cwd = os.getcwd()

pm.execute_notebook(cwd + "/COVID-SB/index.ipynb",
                    cwd + "/COVID-SB/index.ipynb")