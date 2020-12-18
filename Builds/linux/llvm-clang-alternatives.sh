#!/usr/bin/env sh

# Remove all existing alternatives
sudo update-alternatives --remove-all llvm
sudo update-alternatives --remove-all clang

# exit on first error
set -e

# To Install llvm/clang 4.0/5.0
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository -y "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main"
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main"
sudo apt update
sudo apt install -y clang-5.0 llvm-5.0 lld-5.0 lldb-5.0
sudo apt install clang-{format,tidy,tools}-5.0 clang-5.0-doc clang-5.0-examples
sudo apt install -y clang-4.0 llvm-4.0 lld-4.0
sudo apt install clang-{format,tidy}-4.0

# llvm-5.0 and clang-5.0
sudo update-alternatives \
  --install /usr/lib/llvm              llvm             /usr/lib/llvm-5.0  20 \
  --slave   /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-5.0  \
	--slave   /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-5.0 \
	--slave   /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-5.0 \
	--slave   /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-5.0 \
	--slave   /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-5.0 \
	--slave   /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-5.0 \
	--slave   /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-5.0 \
	--slave   /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-5.0 \
	--slave   /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-5.0 \
	--slave   /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-5.0 \
	--slave   /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-5.0 \
	--slave   /usr/bin/llvm-mcmarkup     llvm-mcmarkup    /usr/bin/llvm-mcmarkup-5.0 \
	--slave   /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-5.0 \
	--slave   /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-5.0 \
	--slave   /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-5.0 \
	--slave   /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-5.0 \
	--slave   /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-5.0 \
	--slave   /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-5.0 \
	--slave   /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-5.0 \
	--slave   /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-5.0 \
	--slave   /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-5.0

sudo update-alternatives \
  --install /usr/bin/clang                 clang                  /usr/bin/clang-5.0     20 \
  --slave   /usr/bin/clang++               clang++                /usr/bin/clang++-5.0 \
  --slave   /usr/bin/lld                   lld                    /usr/bin/lld-5.0 \
  --slave   /usr/bin/clang-format          clang-format           /usr/bin/clang-format-5.0  \
  --slave   /usr/bin/clang-tidy            clang-tidy             /usr/bin/clang-tidy-5.0  \
  --slave   /usr/bin/clang-tidy-diff.py    clang-tidy-diff.py     /usr/bin/clang-tidy-diff-5.0.py \
  --slave   /usr/bin/clang-include-fixer   clang-include-fixer    /usr/bin/clang-include-fixer-5.0 \
  --slave   /usr/bin/clang-offload-bundler clang-offload-bundler  /usr/bin/clang-offload-bundler-5.0 \
  --slave   /usr/bin/clangd                clangd                 /usr/bin/clangd-5.0 \
  --slave   /usr/bin/clang-check           clang-check            /usr/bin/clang-check-5.0 \
  --slave   /usr/bin/scan-view             scan-view              /usr/bin/scan-view-5.0 \
  --slave   /usr/bin/clang-apply-replacements clang-apply-replacements /usr/bin/clang-apply-replacements-5.0 \
  --slave   /usr/bin/clang-query           clang-query            /usr/bin/clang-query-5.0 \
  --slave   /usr/bin/modularize            modularize             /usr/bin/modularize-5.0 \
  --slave   /usr/bin/sancov                sancov                 /usr/bin/sancov-5.0 \
  --slave   /usr/bin/c-index-test          c-index-test           /usr/bin/c-index-test-5.0 \
  --slave   /usr/bin/clang-reorder-fields  clang-reorder-fields   /usr/bin/clang-reorder-fields-5.0 \
  --slave   /usr/bin/clang-change-namespace clang-change-namespace  /usr/bin/clang-change-namespace-5.0 \
  --slave   /usr/bin/clang-import-test     clang-import-test      /usr/bin/clang-import-test-5.0 \
  --slave   /usr/bin/scan-build            scan-build             /usr/bin/scan-build-5.0 \
  --slave   /usr/bin/scan-build-py         scan-build-py          /usr/bin/scan-build-py-5.0 \
  --slave   /usr/bin/clang-cl              clang-cl               /usr/bin/clang-cl-5.0 \
  --slave   /usr/bin/clang-rename          clang-rename           /usr/bin/clang-rename-5.0 \
  --slave   /usr/bin/find-all-symbols      find-all-symbols       /usr/bin/find-all-symbols-5.0 \
  --slave   /usr/bin/lldb                  lldb                   /usr/bin/lldb-5.0 \
  --slave   /usr/bin/lldb-server           lldb-server            /usr/bin/lldb-server-5.0
      
# llvm-4.0 and clang-4.0
sudo update-alternatives \
  --install /usr/lib/llvm            llvm             /usr/lib/llvm-4.0  10 \
  --slave /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-4.0  \
	--slave /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-4.0 \
	--slave /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-4.0 \
	--slave /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-4.0 \
	--slave /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-4.0 \
	--slave /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-4.0 \
	--slave /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-4.0 \
	--slave /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-4.0 \
	--slave /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-4.0 \
	--slave /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-4.0 \
	--slave /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-4.0 \
	--slave /usr/bin/llvm-mcmarkup     llvm-mcmarkup    /usr/bin/llvm-mcmarkup-4.0 \
	--slave /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-4.0 \
	--slave /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-4.0 \
	--slave /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-4.0 \
	--slave /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-4.0 \
	--slave /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-4.0 \
	--slave /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-4.0 \
	--slave /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-4.0 \
	--slave /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-4.0 \
	--slave /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-4.0

sudo update-alternatives \
  --install /usr/bin/clang                clang        /usr/bin/clang-4.0     10 \
  --slave   /usr/bin/clang++              clang++      /usr/bin/clang++-4.0 \
  --slave   /usr/bin/lld                  lld          /usr/bin/lld-4.0 \
  --slave   /usr/bin/clang-format         clang-format /usr/bin/clang-format-4.0  \
  --slave   /usr/bin/clang-tidy           clang-tidy   /usr/bin/clang-tidy-4.0  \
  --slave   /usr/bin/clang-tidy-diff.py   clang-tidy-diff.py /usr/bin/clang-tidy-diff-4.0.py  #\

