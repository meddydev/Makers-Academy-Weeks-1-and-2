require 'password_checker'

describe PasswordChecker do
    it "accepts password of 8 or more characters" do
        pass = PasswordChecker.new
        expect(pass.check("academic")).to eq true
        expect(pass.check("academics")).to eq true
    end

    it "returns appropriate error message for password with fewer than 8 characters" do
        pass = PasswordChecker.new
        expect { pass.check("reece") }.to raise_error "Invalid password, must be 8+ characters."
        expect { pass.check("") }.to raise_error "Invalid password, must be 8+ characters."
    end
end