defmodule Spellit.ListController do
  use Spellit.Web, :controller
  import Ecto.Query
  alias Spellit.List

  def index(conn, _params) do
    lists = List
    |> Repo.all
    |> Repo.preload([:words])
    conn
    |> render(:index, lists: lists)
  end
  
  def new(conn, _params) do
    changeset = List.changeset(%List{})
    conn
    |> render(:new, changeset: changeset)
  end

  def create(conn, %{"list" => list_params}) do
    changeset = List.changeset(%List{}, list_params)

    case Repo.insert(changeset) do
      {:ok, list} ->
        conn
        |> put_flash(:info, gettext("List created."))
        |> redirect(to: list_path(conn, :show, list))
      {:error, changeset} ->
        conn
        |> render(:new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    list = List.find_with_all_associations(id)
    conn
    |> assign(:list, list)
    |> render(:show)
  end

  def edit(conn, %{"id" => id}) do
    list = Repo.get!(List, id)
    changeset = List.changeset(list)
    conn
    |> render(:edit, list: list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "list" => list_params}) do
    list = Repo.get!(List, id)
    changeset = List.changeset(list, list_params)
    
    case Repo.update(changeset) do
      {:ok, list} ->
        conn
        |> put_flash(:info, gettext("List name updated."))
        |> redirect(to: list_path(conn, :show, list))
      {:error, changeset} ->
        conn
        |> render(:edit, list: list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    list = Repo.get!(List, id)
    Repo.delete!(list)
    
    conn
    |> put_flash(:info, gettext("List deleted."))
    |> redirect(to: list_path(conn, :index))
  end
end
