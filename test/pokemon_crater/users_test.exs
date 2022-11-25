defmodule PokemonCrater.UsersTest do
  use PokemonCrater.DataCase

  alias PokemonCrater.Users

  describe "trainers" do
    alias PokemonCrater.Users.Trainer

    import PokemonCrater.UsersFixtures

    @invalid_attrs %{name: nil}

    test "list_trainers/0 returns all trainers" do
      trainer = trainer_fixture()
      assert Users.list_trainers() == [trainer]
    end

    test "get_trainer!/1 returns the trainer with given id" do
      trainer = trainer_fixture()
      assert Users.get_trainer!(trainer.id) == trainer
    end

    test "create_trainer/1 with valid data creates a trainer" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Trainer{} = trainer} = Users.create_trainer(valid_attrs)
      assert trainer.name == "some name"
    end

    test "create_trainer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_trainer(@invalid_attrs)
    end

    test "update_trainer/2 with valid data updates the trainer" do
      trainer = trainer_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Trainer{} = trainer} = Users.update_trainer(trainer, update_attrs)
      assert trainer.name == "some updated name"
    end

    test "update_trainer/2 with invalid data returns error changeset" do
      trainer = trainer_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_trainer(trainer, @invalid_attrs)
      assert trainer == Users.get_trainer!(trainer.id)
    end

    test "delete_trainer/1 deletes the trainer" do
      trainer = trainer_fixture()
      assert {:ok, %Trainer{}} = Users.delete_trainer(trainer)
      assert_raise Ecto.NoResultsError, fn -> Users.get_trainer!(trainer.id) end
    end

    test "change_trainer/1 returns a trainer changeset" do
      trainer = trainer_fixture()
      assert %Ecto.Changeset{} = Users.change_trainer(trainer)
    end
  end
end
