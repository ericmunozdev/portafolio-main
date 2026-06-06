DO $$
DECLARE
    profile_id UUID;
BEGIN

  -- LIMPIEZA DE REGISTROS
	TRUNCATE TABLE
    experience_technologies,
    experience_responsibilities,
    experiences,
    educations,
    languages,
    conditions,
    contacts,
    summaries,
    skill,
    skill_category,
    profiles
	RESTART IDENTITY CASCADE;

  -- CREACIÓN DEL PERFIL
	INSERT INTO profiles (title, full_name, description)
	VALUES (
    'Eric Muñoz | Senior Full Stack Developer',
    'Eric Muñoz Medina',
    'Senior Full Stack Software Engineer | Lead Developer'
	)
	RETURNING id INTO profile_id;

	INSERT INTO summaries (profile_id, content, position) VALUES
	(profile_id,'Ingeniero en informática con más de 15 años de experiencia en el diseño, desarrollo y liderazgo de soluciones empresariales de alta complejidad en sectores público y privado. Amplia experiencia en el ecosistema .NET (Framework, Core, 6 y 8), arquitecturas API REST, microservicios y buenas prácticas como DDD, TDD, SOLID y Clean Code',1),
	(profile_id,'Experiencia liderando equipos técnicos, modernización de sistemas legacy, automatización de procesos críticos y despliegues CI/CD. Enfoque en calidad de software, escalabilidad, seguridad y entrega continua de valor al negocio',2);

	INSERT INTO contacts (profile_id, type, name, value, icon, is_active) VALUES
	(profile_id, 'url', 'LinkedIn', 'https://www.linkedin.com/in/eric-michel-munoz-medina', null, true),
	(profile_id, 'url', 'GitHub', 'https://github.com/ericmunozdev', null, true);

	INSERT INTO conditions (profile_id, type, name, value, icon) VALUES
	(profile_id, 'modality', 'Modalidad', 'Remoto', null),
	(profile_id, 'availability', 'Disponibilidad', 'Desde el 01 de Julio 2026', null);

	INSERT INTO languages (profile_id, language, level, description) VALUES
	(profile_id, 'Inglés', 'A1', 'Enfoque técnico');

	INSERT INTO educations (profile_id, title, institution, graduation_year) VALUES
	(profile_id, 'Scrum Máster Professional Certificate (SMPC)', 'CertiProf', 2019),
	(profile_id, 'Ingeniero en Informática', 'Instituto DUOC UC', 2015),
	(profile_id, 'Analista Programador Computacional', 'Instituto DUOC UC', 2008);

  -- CREACIÓN Y ASIGNACIÓN DE HABILIDADES

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'backend', 'Backend', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'asp', 'ASP (clásico)', null, false),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'aspnet', 'ASP.NET', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'aspnetmvc', 'ASP.NET MVC', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'csharp', 'C#', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'entityframework', 'Entity Framework', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'linq', 'LINQ', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'net5', '.NET 5', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'net6', '.NET 6', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'net8', '.NET 8', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'netcore20', '.NET Core 2.0', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'netcore31', '.NET Core 3.1', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'netframework45', '.NET Framework 4.5', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'nodejs', 'Node.js (Express)', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'php', 'PHP', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'python', 'Python', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'visualbasic', 'Visual Basic', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'wcf', 'WCF', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'webservice', 'SOAP Web Services', null, true),
  ((SELECT id FROM skill_category WHERE code = 'backend'), 'xamarin', 'Xamarin', null, false);

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'apis', 'APIs e Integración', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'apis'), 'restapi', 'REST APIs', null, true),
  ((SELECT id FROM skill_category WHERE code = 'apis'), 'swagger', 'Swagger / OpenAPI', null, true),
  ((SELECT id FROM skill_category WHERE code = 'apis'), 'json', 'JSON', null, true),
  ((SELECT id FROM skill_category WHERE code = 'apis'), 'xml', 'XML', null, false),
  ((SELECT id FROM skill_category WHERE code = 'apis'), 'xslt', 'XSLT', null, false),
  ((SELECT id FROM skill_category WHERE code = 'apis'), 'yaml', 'YAML', null, true);

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'frontend', 'Frontend', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'angular', 'Angular', null, true),
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'react', 'React', null, true),
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'vuejs', 'Vue.js', null, true),
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'primevue', 'PrimeVue', null, true),
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'typescript', 'TypeScript', null, true),
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'javascript', 'JavaScript', null, true),
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'jquery', 'jQuery', null, true),
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'ajax', 'Ajax', null, false),
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'bootstrap', 'Bootstrap', null, true),
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'html', 'HTML', null, false),
  ((SELECT id FROM skill_category WHERE code = 'frontend'), 'css', 'CSS', null, true);

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'arquitectura', 'Arquitectura y Diseño', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'arquitectura'), 'ddd', 'Domain-Driven Design (DDD)', null, true),
  ((SELECT id FROM skill_category WHERE code = 'arquitectura'), 'tdd', 'Test-Driven Development (TDD)', null, true),
  ((SELECT id FROM skill_category WHERE code = 'arquitectura'), 'mvc', 'MVC', null, true),
  ((SELECT id FROM skill_category WHERE code = 'arquitectura'), 'cleanarchitecture', 'Clean Architecture', null, true),
  ((SELECT id FROM skill_category WHERE code = 'arquitectura'), 'microservicios', 'Microservicios', null, true),
  ((SELECT id FROM skill_category WHERE code = 'arquitectura'), 'bff', 'BFF', null, true);

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'bbdd', 'Bases de Datos', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'bbdd'), 'sqlserver', 'SQL Server', null, true),
  ((SELECT id FROM skill_category WHERE code = 'bbdd'), 'postgresql', 'PostgreSQL', null, true),
  ((SELECT id FROM skill_category WHERE code = 'bbdd'), 'oracle10g', 'Oracle 10g', null, true),
  ((SELECT id FROM skill_category WHERE code = 'bbdd'), 'oracle11g', 'Oracle 11g', null, true),
  ((SELECT id FROM skill_category WHERE code = 'bbdd'), 'oracle19c', 'Oracle 19c', null, true),
  ((SELECT id FROM skill_category WHERE code = 'bbdd'), 'mysql', 'MySQL', null, true),
  ((SELECT id FROM skill_category WHERE code = 'bbdd'), 'mariadb', 'MariaDb', null, true),
  ((SELECT id FROM skill_category WHERE code = 'bbdd'), 'access', 'Microsoft Access', null, false);

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'devops', 'DevOps', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'devops'), 'azuredevops', 'Azure DevOps', null, true),
  ((SELECT id FROM skill_category WHERE code = 'devops'), 'git', 'Git', null, true),
  ((SELECT id FROM skill_category WHERE code = 'devops'), 'gitflow', 'GitFlow', null, true),
  ((SELECT id FROM skill_category WHERE code = 'devops'), 'tfs', 'TFS', null, true),
  ((SELECT id FROM skill_category WHERE code = 'devops'), 'bitbucket', 'Bitbucket', null, true);

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'infraestructura', 'Infraestructura', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'infraestructura'), 'iis', 'IIS', null, true),
  ((SELECT id FROM skill_category WHERE code = 'infraestructura'), 'nginx', 'NGINX', null, true),
  ((SELECT id FROM skill_category WHERE code = 'infraestructura'), 'apache', 'Apache', null, true),
  ((SELECT id FROM skill_category WHERE code = 'infraestructura'), 'minio', 'MinIO', null, true),
  ((SELECT id FROM skill_category WHERE code = 'infraestructura'), 'ftp', 'FTP', null, false),
  ((SELECT id FROM skill_category WHERE code = 'infraestructura'), 'ftps', 'FTPS', null, false),
  ((SELECT id FROM skill_category WHERE code = 'infraestructura'), 'sftp', 'SFTP', null, false);

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'testing', 'Testing y Calidad', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'testing'), 'mstest', 'MSTest', null, true),
  ((SELECT id FROM skill_category WHERE code = 'testing'), 'xunit', 'xUnit', null, true),
  ((SELECT id FROM skill_category WHERE code = 'testing'), 'mock', 'Mock', null, true),
  ((SELECT id FROM skill_category WHERE code = 'testing'), 'sonarqube', 'SonarQube', null, true),
  ((SELECT id FROM skill_category WHERE code = 'testing'), 'eslint', 'ESLint', null, true),
  ((SELECT id FROM skill_category WHERE code = 'testing'), 'prettier', 'Prettier', null, true);

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'seguridad', 'Seguridad', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'seguridad'), 'jwt', 'JWT', null, true),
  ((SELECT id FROM skill_category WHERE code = 'seguridad'), 'keycloak', 'Keycloak', null, true);

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'datos', 'Datos y Procesos', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'datos'), 'etlpentaho', 'ETL (Pentaho)', null, true),
  ((SELECT id FROM skill_category WHERE code = 'datos'), 'dts', 'DTS (Data Transformation Services)', null, true);

  INSERT INTO skill_category (profile_id, code, name, icon) VALUES (profile_id, 'agil', 'Metodologías Ágiles', null);
  INSERT INTO skill (skill_category_id, code, name, icon, is_visible_gral) VALUES
  ((SELECT id FROM skill_category WHERE code = 'agil'), 'scrum', 'Scrum', null, true),
  ((SELECT id FROM skill_category WHERE code = 'agil'), 'kanban', 'Kanban', null, true),
  ((SELECT id FROM skill_category WHERE code = 'agil'), 'jira', 'Jira', null, true),
  ((SELECT id FROM skill_category WHERE code = 'agil'), 'confluence', 'Confluence', null, true),
  ((SELECT id FROM skill_category WHERE code = 'agil'), 'cicd', 'CI/CD', null, true);

  -- CREACIÓN DE EXPERIENCIAS

	INSERT INTO experiences (profile_id, code, company, role, start_date, end_date) VALUES
	(profile_id, 'consalud', 'Consalud', 'Desarrollador', '2024-06-01', '2026-06-30'),
	(profile_id, 'cramer', 'Carlos Cramer Productos Aromáticos S.A', 'Ingeniero de Software', '2022-12-01', '2024-06-30'),
	(profile_id, 'sma', 'Superintendencia del Medio Ambiente (SMA)', 'Ingeniero de Proyectos', '2017-01-01', '2022-11-30'),
	(profile_id, 'areasiete', 'AreaSiete', 'Líder de Equipo', '2016-09-01', '2016-12-31'),
	(profile_id, 'beco', 'Banco Estado Cobranzas (BECO)', 'Ingeniero de Proyectos', '2014-09-01', '2016-09-30'),
	(profile_id, 'chilecompra', 'ChileCompra', 'Ingeniero de Software', '2013-10-01', '2014-08-31'),
	(profile_id, 'dbnet', 'DBNeT', 'Ingeniero de Software', '2009-09-01', '2013-09-30'),
	(profile_id, 'aso', 'Aso y Rodríguez', 'Analista Programador', '2009-04-01', '2009-08-31'),
	(profile_id, 'dscr', 'DSCR', 'Analista Programador', '2008-03-01', '2009-04-30');

  -- CREACIÓN DE RESPONSABILIDADES EN EXPERIENCIAS

	INSERT INTO experience_responsibilities (experience_id, content, position) VALUES
	((SELECT id FROM experiences WHERE code = 'consalud'), 'Desarrollo de componentes y funcionalidades en aplicaciones empresariales', 1),
	((SELECT id FROM experiences WHERE code = 'consalud'), 'Implementación de servicios RESTful para integración entre sistemas', 2),
	((SELECT id FROM experiences WHERE code = 'consalud'), 'Resolución de requerimientos funcionales en sistemas productivos', 3),
	((SELECT id FROM experiences WHERE code = 'consalud'), 'Creación de pruebas unitarias automatizadas', 4),
	((SELECT id FROM experiences WHERE code = 'consalud'), 'Trabajo colaborativo utilizando Azure DevOps y control de versiones con Git', 5),

	((SELECT id FROM experiences WHERE code = 'cramer'), 'Desarrollo de aplicaciones para la gestión y operabilidad de procesos de fabricación industrial', 1),
	((SELECT id FROM experiences WHERE code = 'cramer'), 'Implementación de recálculos masivos a gran escala utilizando multithreading', 2),
	((SELECT id FROM experiences WHERE code = 'cramer'), 'Seguimiento y soporte de procesos productivos mediante soluciones de software', 3),
	((SELECT id FROM experiences WHERE code = 'cramer'), 'Participación en testing, despliegues y mejoras continuas de los sistemas', 4),

	((SELECT id FROM experiences WHERE code = 'sma'), 'Desarrollo de sistemas nacionales para la fiscalización ambiental', 1),
	((SELECT id FROM experiences WHERE code = 'sma'), 'Creación y mantenimiento de APIs REST y microservicios', 2),
	((SELECT id FROM experiences WHERE code = 'sma'), 'Desarrollo de plataformas de información para la ciudadanía', 3),
	((SELECT id FROM experiences WHERE code = 'sma'), 'Liderazgo técnico en equipos ágiles bajo Scrum', 4),
	((SELECT id FROM experiences WHERE code = 'sma'), 'Implementación de pipelines CI/CD y pruebas automatizadas', 5),

	((SELECT id FROM experiences WHERE code = 'areasiete'), 'Coordinación de equipo de desarrollo y asignación de tareas', 1),
	((SELECT id FROM experiences WHERE code = 'areasiete'), 'Optimización y mantenimiento de aplicaciones empresariales', 2),
	((SELECT id FROM experiences WHERE code = 'areasiete'), 'Análisis de requerimientos de negocio y gestión directa con clientes', 3),
	((SELECT id FROM experiences WHERE code = 'areasiete'), 'Supervisión de la implementación del sistema de Factura Electrónica', 4),

	((SELECT id FROM experiences WHERE code = 'beco'), 'Liderazgo técnico en requerimientos y proyectos de desarrollo', 1),
	((SELECT id FROM experiences WHERE code = 'beco'), 'Análisis funcional de procesos de negocio', 2),
	((SELECT id FROM experiences WHERE code = 'beco'), 'Optimización de aplicaciones y mejora de calidad e integridad de datos', 3),
	((SELECT id FROM experiences WHERE code = 'beco'), 'Gestión de tareas y planificación bajo metodología Kanban', 4),

	((SELECT id FROM experiences WHERE code = 'chilecompra'), 'Desarrollo de sistemas para la gestión de compras públicas', 1),
	((SELECT id FROM experiences WHERE code = 'chilecompra'), 'Implementación de mejoras y actualizaciones según requerimientos del negocio', 2),
	((SELECT id FROM experiences WHERE code = 'chilecompra'), 'Desarrollo de funcionalidades frontend y backend en aplicaciones web', 3),
	((SELECT id FROM experiences WHERE code = 'chilecompra'), 'Integración con bases de datos y mantenimiento de sistemas productivos', 4),

	((SELECT id FROM experiences WHERE code = 'dbnet'), 'Gestión técnica y funcional de proyectos de desarrollo de software', 1),
	((SELECT id FROM experiences WHERE code = 'dbnet'), 'Planificación de tiempos de desarrollo y control de compromisos técnicos', 2),
	((SELECT id FROM experiences WHERE code = 'dbnet'), 'Desarrollo de aplicaciones empresariales y administración de bases de datos', 3),
	((SELECT id FROM experiences WHERE code = 'dbnet'), 'Administración de documentación bajo estándares de calidad (ISO 9001 / CMM)', 4),

	((SELECT id FROM experiences WHERE code = 'aso'), 'Desarrollo de sistema comercial orientado a la gestión de ventas para pymes', 1),
	((SELECT id FROM experiences WHERE code = 'aso'), 'Implementación de funcionalidades web para administración de productos y transacciones', 2),
	((SELECT id FROM experiences WHERE code = 'aso'), 'Integración con base de datos para gestión de información comercial', 3),

	((SELECT id FROM experiences WHERE code = 'dscr'), 'Desarrollo de sistema para control de tarificación en plataformas de telefonía IP', 1),
	((SELECT id FROM experiences WHERE code = 'dscr'), 'Implementación de funcionalidades de cálculo y gestión de registros de llamadas', 2),
	((SELECT id FROM experiences WHERE code = 'dscr'), 'Integración con plataforma Asterisk para procesamiento de información de telefonía', 3);

  -- ASIGNACIÓN DE TECNOLOGÍAS A EXPERIENCIAS

  INSERT INTO experience_technologies (experience_id, skill_id) VALUES
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'azuredevops')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'bootstrap')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'csharp')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'git')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'iis')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'javascript')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'jquery')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'json')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'linq')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'mock')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'mstest')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'mvc')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'net6')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'oracle11g')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'restapi')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'wcf')),
  ((SELECT id FROM experiences WHERE code = 'consalud'), (SELECT id FROM skill WHERE code = 'xunit'));

  INSERT INTO experience_technologies (experience_id, skill_id) VALUES
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'bootstrap')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'bff')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'csharp')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'ddd')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'etlpentaho')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'git')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'javascript')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'jquery')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'json')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'linq')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'mvc')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'net6')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'net8')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'oracle19c')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'react')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'webservice')),
  ((SELECT id FROM experiences WHERE code = 'cramer'), (SELECT id FROM skill WHERE code = 'xamarin'));

  INSERT INTO experience_technologies (experience_id, skill_id) VALUES
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'bff')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'bitbucket')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'bootstrap')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'cicd')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'cleanarchitecture')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'confluence')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'csharp')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'ddd')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'entityframework')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'eslint')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'git')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'gitflow')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'iis')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'javascript')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'jira')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'jquery')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'json')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'jwt')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'kanban')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'keycloak')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'linq')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'microservicios')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'minio')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'mock')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'mstest')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'mvc')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'net5')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'net6')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'netcore20')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'netcore31')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'netframework45')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'nginx')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'nodejs')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'postgresql')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'prettier')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'primevue')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'python')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'restapi')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'scrum')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'sonarqube')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'sqlserver')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'tdd')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'tfs')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'typescript')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'vuejs')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'wcf')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'xml')),
  ((SELECT id FROM experiences WHERE code = 'sma'), (SELECT id FROM skill WHERE code = 'yaml'));

  INSERT INTO experience_technologies (experience_id, skill_id) VALUES
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'access')),
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'ajax')),
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'asp')),
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'css')),
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'ftp')),
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'ftps')),
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'javascript')),
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'jquery')),
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'json')),
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'sftp')),
  ((SELECT id FROM experiences WHERE code = 'areasiete'), (SELECT id FROM skill WHERE code = 'sqlserver'));

  INSERT INTO experience_technologies (experience_id, skill_id) VALUES
  ((SELECT id FROM experiences WHERE code = 'beco'), (SELECT id FROM skill WHERE code = 'ajax')),
  ((SELECT id FROM experiences WHERE code = 'beco'), (SELECT id FROM skill WHERE code = 'aspnet')),
  ((SELECT id FROM experiences WHERE code = 'beco'), (SELECT id FROM skill WHERE code = 'css')),
  ((SELECT id FROM experiences WHERE code = 'beco'), (SELECT id FROM skill WHERE code = 'dts')),
  ((SELECT id FROM experiences WHERE code = 'beco'), (SELECT id FROM skill WHERE code = 'iis')),
  ((SELECT id FROM experiences WHERE code = 'beco'), (SELECT id FROM skill WHERE code = 'jquery')),
  ((SELECT id FROM experiences WHERE code = 'beco'), (SELECT id FROM skill WHERE code = 'json')),
  ((SELECT id FROM experiences WHERE code = 'beco'), (SELECT id FROM skill WHERE code = 'sqlserver')),
  ((SELECT id FROM experiences WHERE code = 'beco'), (SELECT id FROM skill WHERE code = 'visualbasic'));

  INSERT INTO experience_technologies (experience_id, skill_id) VALUES
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'ajax')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'aspnetmvc')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'csharp')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'css')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'iis')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'javascript')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'jquery')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'json')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'linq')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'mvc')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'netframework45')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'sqlserver')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'tfs')),
  ((SELECT id FROM experiences WHERE code = 'chilecompra'), (SELECT id FROM skill WHERE code = 'xml'));

  INSERT INTO experience_technologies (experience_id, skill_id) VALUES
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'ajax')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'aspnet')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'csharp')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'css')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'iis')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'javascript')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'jquery')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'linq')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'netframework45')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'oracle10g')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'sqlserver')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'webservice')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'xml')),
  ((SELECT id FROM experiences WHERE code = 'dbnet'), (SELECT id FROM skill WHERE code = 'xslt'));

  INSERT INTO experience_technologies (experience_id, skill_id) VALUES
  ((SELECT id FROM experiences WHERE code = 'aso'), (SELECT id FROM skill WHERE code = 'ajax')),
  ((SELECT id FROM experiences WHERE code = 'aso'), (SELECT id FROM skill WHERE code = 'apache')),
  ((SELECT id FROM experiences WHERE code = 'aso'), (SELECT id FROM skill WHERE code = 'css')),
  ((SELECT id FROM experiences WHERE code = 'aso'), (SELECT id FROM skill WHERE code = 'html')),
  ((SELECT id FROM experiences WHERE code = 'aso'), (SELECT id FROM skill WHERE code = 'javascript')),
  ((SELECT id FROM experiences WHERE code = 'aso'), (SELECT id FROM skill WHERE code = 'jquery')),
  ((SELECT id FROM experiences WHERE code = 'aso'), (SELECT id FROM skill WHERE code = 'mysql')),
  ((SELECT id FROM experiences WHERE code = 'aso'), (SELECT id FROM skill WHERE code = 'php'));

  INSERT INTO experience_technologies (experience_id, skill_id) VALUES
  ((SELECT id FROM experiences WHERE code = 'dscr'), (SELECT id FROM skill WHERE code = 'ajax')),
  ((SELECT id FROM experiences WHERE code = 'dscr'), (SELECT id FROM skill WHERE code = 'apache')),
  ((SELECT id FROM experiences WHERE code = 'dscr'), (SELECT id FROM skill WHERE code = 'css')),
  ((SELECT id FROM experiences WHERE code = 'dscr'), (SELECT id FROM skill WHERE code = 'html')),
  ((SELECT id FROM experiences WHERE code = 'dscr'), (SELECT id FROM skill WHERE code = 'javascript')),
  ((SELECT id FROM experiences WHERE code = 'dscr'), (SELECT id FROM skill WHERE code = 'jquery')),
  ((SELECT id FROM experiences WHERE code = 'dscr'), (SELECT id FROM skill WHERE code = 'mysql')),
  ((SELECT id FROM experiences WHERE code = 'dscr'), (SELECT id FROM skill WHERE code = 'php'));

END;
$$;