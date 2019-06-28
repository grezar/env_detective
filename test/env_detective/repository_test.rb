require "test_helper"

module EnvDetective
  class RepositoryTest < Minitest::Test
    def test_that_respond_to_store
      assert_respond_to EnvDetective::Repository, :store
    end

    def test_that_respond_to_stored?
      assert_respond_to EnvDetective::Repository, :stored?
    end

    def test_that_stored_returns_false_when_the_same_key_has_not_stored_yet
      EnvDetective::Repository.instance.repo.delete(stub_key)
      assert_nil EnvDetective::Repository.stored?(stub_key)
    end

    def test_that_stored_returns_true_when_the_same_key_has_already_stored
      EnvDetective::Repository.store(stub_key, stub_name)
      assert EnvDetective::Repository.stored?(stub_key)
    end

    private

    def stub_key
      "[]@/path/to/method/called/location:1:in `call`".to_sym
    end

    def stub_name
      "stub_name"
    end
  end
end
