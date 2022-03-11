class UserService
  class << self
    def getAllUsers
      @users = UserRepository.getAllUsers
    end

    def getUserById(id)
      @user = UserRepository.getUserById(id)
    end

    def createUser(user)
      @is_user_create = UserRepository.createUser(user)
    end

    def updateUser(user, user_params)
      @is_user_update = UserRepository.updateUser(user, user_params)
    end

    def destroy(user)
      @is_user_destroy = UserRepository.destroy(user)
    end
  end
end
