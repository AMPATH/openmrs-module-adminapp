/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */

package org.openmrs.module.adminapp.page.controller;

import org.openmrs.module.ModuleFactory;
import org.openmrs.module.appframework.service.AppFrameworkService;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;

import java.util.LinkedHashMap;
import java.util.Map;

public class AdminPageController {

	public void controller(PageModel pageModel, @SpringBean("appFrameworkService") AppFrameworkService appFrameworkService) {

		Map<String, String> sections = new LinkedHashMap<String, String>();
		sections.put("general", "General Settings");
		sections.put("users", "Users");
		sections.put("patients", "Patients");
		pageModel.addAttribute("sections", sections);

		pageModel.addAttribute("modules", ModuleFactory.getExtensions("org.openmrs.admin.list"));
	}
}
