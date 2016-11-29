module LikesHelper
  def like target_id,user_id
    return Like.where(target_id:target_id,user_id:user_id).any?
  end

  def toggle_like_button(activity,user)
    if Like.where(target_id:activity.id,user_id:current_user.id).any?
      link_to " DisLike",like_path(id:activity.id,user_id:user.id),method: "delete",remote:true,class: "fa fa-thumbs-o-down",id:"dis#{activity.id}"
    else
      link_to " Like",likes_path(id:activity.id,user_id:user.id),remote:true,class: "fa fa-thumbs-o-up",id:"like#{activity.id}"
    end
  end
end
