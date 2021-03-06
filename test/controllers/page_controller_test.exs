defmodule RemoteRetro.PageControllerTest do
  use RemoteRetroWeb.ConnCase, async: true

  import ShorterMaps

  describe "authenticated visits to root" do
    setup [:authenticate_connection]

    test "redirect to the dashboard at /retros", ~M{conn} do
      conn = get conn, "/"

      assert redirected_to(conn) =~ "/retros"
    end
  end

  describe "unauthenticated visits to root" do
    test "asks users to authenticate", ~M{conn} do
      conn = get conn, "/"

      assert html_response(conn, 200) =~ ~r/sign in with google/i
    end
  end

  test "GET /faq", ~M{conn} do
    conn = get conn, "/faq"
    assert html_response(conn, 200) =~ "Frequently Asked Questions"
  end
end
