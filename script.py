# This is the script file that prepares an interactive ford session. To open up
# the ipython interpretor, use the following command:
#     export PYTHONPATH="$HOME/Projects/ford":$PYTHONPATH
#     ipython script.py -i -- project.md

import ford

proj_data, proj_docs, md = ford.initialize()

if proj_data['relative']:
    proj_data['project_url'] = '.'

project = ford.fortran_project.Project(proj_data)

if proj_data['relative']:
    project.markdown(md,'..')
else:
    project.markdown(md,proj_data['project_url'])
