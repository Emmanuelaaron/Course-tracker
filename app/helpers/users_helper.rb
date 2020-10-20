module UsersHelper
  def signup_errors(_user)
    render inline:
    '
    <%if @user.errors%>
        <%@user.errors.full_messages.each do |error|%>
            <div class="errors"><%=error %></div>
        <%end%>
    <%end%>
    '
  end
end
