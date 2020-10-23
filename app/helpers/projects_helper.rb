module ProjectsHelper
  def project_added(project, course)
    link_to 'Add to this module',
            addinternalproject_path(
              {
                project_id: project.id, coursemodule_id: course.id
              }
            ), method: :post
  end

  def externalprojects(project)
    if project.coursemodules.empty?
      content_tag(
        :div,
        content_tag(
          :div,
          link_to(
            project.name, project_path(project)
          )
        ),
        class: %w[
          profile_content
          bg-light mr-3
          ml-3 d-flex justify-content-between
          pl-4 pr-4 align-items-center mb-4
        ]
      )
    end
  end

  def display_internal_projects(_internalprojects)
    render inline: '
    <% if @internalprojects.empty?%>
      <%= render :partial => "no_projects"%>
    <%else%>
      <%@internalprojects.first.all.each do |project|%>
          <div class="row, justify-content-between">
              <div class="profile_content bg-light mr-3 ml-3 d-flex
              justify-content-between pl-4 pr-4 align-items-center mb-4">
                  <div>
                      <img src=<%=url_for(project.coursemodules.first.avatar)%> class="col-2">
                  </div>
                  <%=project.name%>
              </div>
          </div>
      <%end%>
  <%end%>
    '
  end

  def project_errors(project)
    project.errors&.full_messages&.each do |error|
      content_tag(
        :div,
        error,
        class: %w[
          errors
        ]
      )
    end
  end

  def current_user_logged_in?
    render 'loggedin' if logged_in?
  end
end
