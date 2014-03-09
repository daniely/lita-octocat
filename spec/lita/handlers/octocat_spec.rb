require "spec_helper"

describe Lita::Handlers::Octocat, lita_handler: true do
  it { routes_command("octocat me").to(:octocat) }

  describe '#octocat' do
    let(:response) { double("Faraday::Response") }

    before do
      allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(response)
    end

    it "replies with octocat ascii" do
      ascii = <<EOS
               MMM.           .MMM
               MMMMMMMMMMMMMMMMMMM
               MMMMMMMMMMMMMMMMMMM      _____________________________________________
              MMMMMMMMMMMMMMMMMMMMM    |                                             |
             MMMMMMMMMMMMMMMMMMMMMMM   | Half measures are as bad as nothing at all. |
            MMMMMMMMMMMMMMMMMMMMMMMM   |_   _________________________________________|
            MMMM::- -:::::::- -::MMMM    |/
             MM~:~   ~:::::~   ~:~MM
        .. MMMMM::. .:::+:::. .::MMMMM ..
              .MM::::: ._. :::::MM.
                 MMMM;:::::;MMMM
          -MM        MMMMMMM
          ^  M+     MMMMMMMMM
              MMMMMMM MM MM MM
                   MM MM MM MM
                   MM MM MM MM
                .~~MM~MM~MM~MM~~.
             ~~~~MM:~MM~~~MM~:MM~~~~
            ~~~~~~==~==~~~==~==~~~~~~
             ~~~~~~==~==~==~==~~~~~~
                 :~==~==~==~==~~
EOS
      allow(response).to receive(:status).and_return(200)
      allow(response).to receive(:body).and_return(ascii)
      send_command("octocat me")
      expect(replies.last).to eq(ascii)
    end

    it "logs a warning on failure" do
      allow(response).to receive(:status).and_return(500)
      expect(Lita.logger).to receive(:warn).with(/could not be reached./)
      send_command("octocat me")
      expect(replies).to be_empty
    end
  end
end
