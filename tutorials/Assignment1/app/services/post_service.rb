class PostService
  class << self
    def getAllPosts
      @posts = PostRepository.getAllPosts
    end

    def getPostById(id)
      @post = PostRepository.getPostById(id)
    end

    def createPost(post)
      @is_post_create = PostRepository.createPost(post)
    end

    def updatePost(post, post_params)
      @is_post_update = PostRepository.updatePost(post, post_params)
    end

    def destroy(post)
      @is_post_destroy = PostRepository.destroy(post)
    end
  end
end