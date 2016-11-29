module BooksHelper
  def check_rate book_id,condition
    active=Activity.where(user_id:current_user.id,target_id:book_id,action:condition)
    return active.any?
  end

  def avg_rating book_id
    return count_rating=Activity.where(action: t("rating"),target_id:book_id,target_type:"book").count+1
  end
end
