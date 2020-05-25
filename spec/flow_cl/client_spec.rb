RSpec.describe FlowCl::Client do
  subject { FlowCl::Client.new('key', 'secret', sandbox: true) }

  it "append apiKey and s keys to final params" do
    params = { foo: 'bar', amount: 100 }
    expect(subject.send(:final_params, params).keys).to include(:s, :apiKey, :foo, :amount)
  end

  # El string concatenado se debe firmar con la función hmac utilizando el algoritmo sha256 y secretKey como llave
  it "signature params" do
    params = { foo: 'bar', amount: 100 }
    expect(subject.send(:signature, params)).to eq "95e3c2282a4608ac40ca1ba6908e40b40bb5075a72ab0e4cc45de30fb6cbe708"
  end
end