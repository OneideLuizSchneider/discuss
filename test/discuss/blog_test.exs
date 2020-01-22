defmodule Discuss.BlogTest do
  use Discuss.DataCase

  alias Discuss.Blog

  describe "topic" do
    alias Discuss.Blog.Topic

    @valid_attrs %{tittle: "some tittle"}
    @update_attrs %{tittle: "some updated tittle"}
    @invalid_attrs %{tittle: nil}

    def topic_fixture(attrs \\ %{}) do
      {:ok, topic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_topic()

      topic
    end

    test "list_topic/0 returns all topic" do
      topic = topic_fixture()
      assert Blog.list_topic() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Blog.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      assert {:ok, %Topic{} = topic} = Blog.create_topic(@valid_attrs)
      assert topic.tittle == "some tittle"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{} = topic} = Blog.update_topic(topic, @update_attrs)
      assert topic.tittle == "some updated tittle"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_topic(topic, @invalid_attrs)
      assert topic == Blog.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Blog.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Blog.change_topic(topic)
    end
  end

  describe "user" do
    alias Discuss.Blog.User

    @valid_attrs %{email: "some email", provider: "some provider", token: "some token"}
    @update_attrs %{email: "some updated email", provider: "some updated provider", token: "some updated token"}
    @invalid_attrs %{email: nil, provider: nil, token: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_user()

      user
    end

    test "list_user/0 returns all user" do
      user = user_fixture()
      assert Blog.list_user() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Blog.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Blog.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.provider == "some provider"
      assert user.token == "some token"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Blog.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.provider == "some updated provider"
      assert user.token == "some updated token"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_user(user, @invalid_attrs)
      assert user == Blog.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Blog.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Blog.change_user(user)
    end
  end
end
