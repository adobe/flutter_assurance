/*
Copyright 2020 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

// This class is used to set the UI log color
class ACPGriffonUILogColor {
  final String value;

  const ACPGriffonUILogColor(this.value);

  static const ACPGriffonUILogColor VISIBILITY_LOW =
      const ACPGriffonUILogColor("ACPGRIFFON_UI_LOG_COLOR_LOW");
  static const ACPGriffonUILogColor VISIBILITY_NORMAL =
      const ACPGriffonUILogColor("ACPGRIFFON_UI_LOG_COLOR_NORMAL");
  static const ACPGriffonUILogColor VISIBILITY_HIGH =
      const ACPGriffonUILogColor("ACPGRIFFON_UI_LOG_COLOR_HIGH");
  static const ACPGriffonUILogColor VISIBILITY_CRITICAL =
      const ACPGriffonUILogColor("ACPGRIFFON_UI_LOG_COLOR_CRITICAL");
}
