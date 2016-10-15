describe Coordinator, type: :model do

  describe "validations" do
    it { is_expected.to have_valid(:key).when(SecureRandom.hex) }
    it { is_expected.to have_valid(:secret).when(SecureRandom.hex) }
  end

  describe "on create" do
    let(:coordinator) { Coordinator.new }

    it "generates all the necessary credentials" do
      expect {
        coordinator.save
      }.to change {
        coordinator.key
      }.from(nil).and change {
        coordinator.secret
      }.from(nil)
    end
  end

end