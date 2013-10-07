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
		sections.put("maintenance", "General Settings");
		sections.put("users", "User.header");
		sections.put("patients", "Patient.header");
		sections.put("person", "Person.header");
		sections.put("visits", "Visit.header");
		sections.put("encounters", "Encounter.header");
		sections.put("provider", "Provider.header");
		sections.put("locations", "Location.header");
		sections.put("observations", "Obs.header");
		sections.put("orders", "Order.header");
		sections.put("scheduler", "Scheduler.header");
		sections.put("programs", "Program.header");
		sections.put("concepts", "Concept.header");
		sections.put("forms", "Form.header");
		sections.put("hl7", "Hl7Messages.header");
		sections.put("modules", "Module.header");

		pageModel.addAttribute("sections", sections);

		pageModel.addAttribute("modules", ModuleFactory.getExtensions("org.openmrs.admin.list"));
	}
}
