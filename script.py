import ford

proj_data, proj_docs, md = ford.initialize()

if proj_data['relative']:
    proj_data['project_url'] = '.'

project = ford.fortran_project.Project(proj_data)

if proj_data['relative']:
    project.markdown(md,'..')
else:
    project.markdown(md,proj_data['project_url'])
