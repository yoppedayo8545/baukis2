require "rails_helper"

describe "管理者による自分のアカウントの管理", "ログイン前" do
  include_examples "a protected singular admin controller", "admin/accounts"
end

describe "管理者による自分のアカウント管理" do
  before do
    post admin_session_url,
      params: {
        admin_login_form: {
          email: administrator.email,
          password: "pw" 
        }
      }
  end

  describe "セッション" do
    example "停止フラグがセットされたら強制的にログアウト" do
      administrator.update_column(:suspended, true)
      get admin_account_url
      expect(response).to redirect_to(admin_root_url)
    end

    example "セッションタイムアウト" do
      travel_to Admin::Base::TIMEOUT.from_now.advance(seconds: 1)
      get admin_account_url
      expect(response).to redirect_to(admin_login_url)
    end
  end
end