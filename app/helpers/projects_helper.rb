module ProjectsHelper
  def project_added(project, course)
    # pro = Internalproject.find_by(project_id: project.id)
    if !project.internalprojects.find_by(coursemodule_id: course.id).nil?
      render 'added'
    else
      link_to 'Add to this module',
              addinternalproject_path(
                {
                  project_id: project.id, coursemodule_id: course.id
                }
              ), method: :post
    end
  end
end
