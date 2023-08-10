module Admin
  class PagesController < BaseController
    before_action :set_page, only: %i[show edit update destroy]

    def index
      @pages = Page.all
    end

    def show; end

    def edit; end

    def update
      if @page.update(page_params)
        redirect_to admin_page_path(@page),
                    notice: t('.success')
      else
        redirect_to edit_admin_page_path(@page),
                    alert: @page.errors.full_messages
      end
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to admin_page_path(@page),
                    notice: t('.success')
      else
        redirect_to new_admin_page_path,
                    alert: @page.errors.full_messages
      end
    end

    def destroy
      @page.destroy

      redirect_to admin_pages_path,
                  notice: t('.success')
    end

    private

    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page)
            .permit(:title,
                    :body,
                    :available,
                    :admin_user_id)
    end
  end
end
