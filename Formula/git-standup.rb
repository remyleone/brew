class GitStandup < Formula
  desc "Git extension to generate reports for standup meetings"
  homepage "https://github.com/kamranahmedse/git-standup"
  url "https://github.com/kamranahmedse/git-standup/archive/2.3.1.tar.gz"
  sha256 "79c75cb3219f022c55d9df93c1292547745d28ccb62252faf52fe6023a41c60c"
  head "https://github.com/kamranahmedse/git-standup.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "bd18e5625605805f45473083ac6bf5c83009495575c09966884c00661d7a2682" => :mojave
    sha256 "c3a46d5566ecaa3af2acb0872e1f82a8063e4f3c0e23a2b2ff1604e676a478b5" => :high_sierra
    sha256 "c3a46d5566ecaa3af2acb0872e1f82a8063e4f3c0e23a2b2ff1604e676a478b5" => :sierra
  end

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "git", "init"
    (testpath/"test").write "test"
    system "git", "add", "#{testpath}/test"
    system "git", "commit", "--message", "test"
    system "git", "standup"
  end
end
