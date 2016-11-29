module RequestsHelper
  def Request_Toggle request
    unless current_user.is_admin
      unless request.status
        link_to t("cancel"), request_path(id:request.id), method: "delete",
          class: "fa fa-check",data: {confirm: t("confirm")}
      end
    end
  end
end
