commercial-visionary-bushman
============================

Chef recipes make pretty heavy use of modules to extend instances of Chef::Recipe and
Chef::Resource with helper methods. In the course of ChefSpec testing it will often
be necessary to stub the return values of those helper methods. One might expect to
stub them with something like `Chef::Recipe.any_instance.stub(:some_helper_method)`
but that mighn't work as expected because Chef may reload the cookbook libraries,
wiping out your stubs.

This project contains a few different stub implementations, some of which work better
than others. `extend`ing individual recipes and resources prevents namespace pollution
but doesn't work well when stubbing module methods. `include`ing library modules into
Chef::Recipe and Chef::Resource by re-opening those classes works more predictably for
testing but runs the risk of namespace collision because library methods will wind up
in *every* recipe and resource block.  Name your helper methods carefully when choosing
the latter.

See: https://github.com/sethvargo/chefspec/issues/253

To run the tests:

    $ cd <checkout_dir>
    $ bundle
    $ bundle exec rake
