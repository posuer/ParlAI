#!/usr/bin/env python3

# Copyright (c) Facebook, Inc. and its affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

"""
Unit tests for general checks of code quality.
"""

import unittest
import os
import parlai.utils.testing as testing_utils


class TestInit(unittest.TestCase):
    """
    Make sure all python packages have init files.
    """

    def test_init_everywhere(self):
        for folder_path in testing_utils.git_ls_dirs('parlai'):
            excluded_folders = ['mturk', 'webapp']
            if any(folder_name in folder_path for folder_name in excluded_folders):
                continue
            self.assertIn(
                '__init__.py',
                os.listdir(folder_path),
                '{} does not contain __init__.py'.format(folder_path),
            )


if __name__ == '__main__':
    unittest.main()
