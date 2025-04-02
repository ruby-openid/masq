# Masq2 OpenID Server

## ⚠️☢️ SECURITY WARNING ☢️⚠️

- The roots of this gem are ancient, and there are more modern options.
- This gem is based on OpenID 2.0, which is a **deprecated standard**.
- The modern alternative is called OpenID Connect (OIDC).
- This gem **does not** support OIDC.
- Many, if not all, of the [current security vulnerabilities](https://github.com/oauth-xx/masq2/security/code-scanning) **will not be fixed**.
- The purpose of this gem is to help legacy systems modernize, one step at a time, by allowing them to get onto modern Ruby / Rails.
- If you find this useful, please consider sponsoring me!

## Read above before continuing

[![Version][👽versioni]][👽version]
[![License: MIT][📄license-img]][📄license-ref]
[![Downloads Rank][👽dl-ranki]][👽dl-rank]
[![Open Source Helpers][👽oss-helpi]][👽oss-help]
[![Depfu][🔑depfui♻️]][🔑depfu]
[![CodeCov Test Coverage][🔑codecovi♻️]][🔑codecov]
[![Coveralls Test Coverage][🔑coveralls-img]][🔑coveralls]
[![CodeClimate Test Coverage][🔑cc-covi♻️]][🔑cc-cov]
[![Maintainability][🔑cc-mnti♻️]][🔑cc-mnt]
[![CI Heads][🚎3-hd-wfi]][🚎3-hd-wf]
[![CI Current][🚎11-c-wfi]][🚎11-c-wf]
[![CI Supported][🚎6-s-wfi]][🚎6-s-wf]
[![CI Legacy][🚎4-lg-wfi]][🚎4-lg-wf]
[![CI Unsupported][🚎7-us-wfi]][🚎7-us-wf]
[![CI Test Coverage][🚎2-cov-wfi]][🚎2-cov-wf]
[![CI Style][🚎5-st-wfi]][🚎5-st-wf]

---

[![Liberapay Patrons][⛳liberapay-img]][⛳liberapay]
[![Sponsor Me on Github][🖇sponsor-img]][🖇sponsor]
[![Buy me a coffee][🖇buyme-small-img]][🖇buyme]
[![Polar Shield][🖇polar-img]][🖇polar]
[![Donate to my FLOSS or refugee efforts at ko-fi.com][🖇kofi-img]][🖇kofi]
[![Donate to my FLOSS or refugee efforts using Patreon][🖇patreon-img]][🖇patreon]

Masq2 is a mountable Rails engine that provides OpenID server/identity provider functionality.
It is the successor to the [masq gem](https://github.com/dennisreimann/masq), which in turn
was the successor of the stand-alone Rails application of the same purpose, [masquerade](http://github.com/dennisreimann/masquerade/).

Because of this history, and the desire to be drop-in compatible with `masq`,
the namespace remains `Masq`, not `Masq2`.

The project is released under the MIT-License and its source code is available at [GitHub](http://github.com/oauth-xx/masq2/).
Feel free to fork and submit patches :)

## Info you can shake a stick at

| Tokens to Remember      | [![Gem name][⛳️name-img]][⛳️gem-name] [![Gem namespace][⛳️namespace-img]][⛳️gem-namespace]                                                                                                                                                                                                                                                                                                                                                                          |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Works with MRI Ruby 3   | [![Ruby 3.0 Compat][💎ruby-3.0i]][🚎4-lg-wf] [![Ruby 3.1 Compat][💎ruby-3.1i]][🚎6-s-wf] [![Ruby 3.2 Compat][💎ruby-3.2i]][🚎6-s-wf] [![Ruby 3.3 Compat][💎ruby-3.3i]][🚎6-s-wf] [![Ruby 3.4 Compat][💎ruby-c-i]][🚎11-c-wf] [![Ruby HEAD Compat][💎ruby-headi]][🚎3-hd-wf]                                                                                                                                                                                         |
| Works with MRI Ruby 2   | [![Ruby 2.7 Compat][💎ruby-2.7i]][🚎7-us-wf]                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Source                  | [![Source on GitLab.com][📜src-gl-img]][📜src-gl] [![Source on Github.com][📜src-gh-img]][📜src-gh] [![The best SHA: dQw4w9WgXcQ!][🧮kloc-img]][🧮kloc]                                                                                                                                                                                                                                                                                                             |
| Documentation           | [![Current release on RubyDoc.info][📜docs-cr-rd-img]][🚎yard-current] [![HEAD on RubyDoc.info][📜docs-head-rd-img]][🚎yard-head] [![BDFL Blog][🚂bdfl-blog-img]][🚂bdfl-blog] [![Wiki][📜wiki-img]][📜wiki]                                                                                                                                                                                                                                                        |
| Compliance              | [![License: MIT][📄license-img]][📄license-ref] [![📄ilo-declaration-img]][📄ilo-declaration] [![Security Policy][🔐security-img]][🔐security] [![CodeQL][🖐codeQL-img]][🖐codeQL] [![Contributor Covenant 2.1][🪇conduct-img]][🪇conduct] [![SemVer 2.0.0][📌semver-img]][📌semver] [![Keep-A-Changelog 1.0.0][📗keep-changelog-img]][📗keep-changelog]                                                                                                            |
| Expert 1:1 Support      | [![Get help from me on Upwork][👨🏼‍🏫expsup-upwork-img]][👨🏼‍🏫expsup-upwork] `or` [![Get help from me on Codementor][👨🏼‍🏫expsup-codementor-img]][👨🏼‍🏫expsup-codementor]                                                                                                                                                                                                                                                                                    |
| Enterprise Support      | [![Get help from me on Tidelift][🏙️entsup-tidelift-img]][🏙️entsup-tidelift]<br/>💡Subscribe for support guarantees covering _all_ FLOSS dependencies!<br/>💡Tidelift is part of [Sonar][🏙️entsup-tidelift-sonar]!<br/>💡Tidelift pays maintainers to maintain the software you depend on!<br/>📊`@`Pointy Haired Boss: An [enterprise support][🏙️entsup-tidelift] subscription is "[never gonna let you down][🧮kloc]", and *supports* open source maintainers! |
| Comrade BDFL 🎖️        | [![Follow Me on LinkedIn][💖🖇linkedin-img]][💖🖇linkedin] [![Follow Me on Ruby.Social][💖🐘ruby-mast-img]][💖🐘ruby-mast] [![Follow Me on Bluesky][💖🦋bluesky-img]][💖🦋bluesky] [![Contact BDFL][🚂bdfl-contact-img]][🚂bdfl-contact] [![My technical writing][💖💁🏼‍♂️devto-img]][💖💁🏼‍♂️devto]                                                                                                                                                              |
| `...` 💖                | [![Find Me on WellFound:][💖✌️wellfound-img]][💖✌️wellfound] [![Find Me on CrunchBase][💖💲crunchbase-img]][💖💲crunchbase] [![My LinkTree][💖🌳linktree-img]][💖🌳linktree] [![More About Me][💖💁🏼‍♂️aboutme-img]][💖💁🏼‍♂️aboutme]                                                                                                                                                                                                                             |

## Installation

1. In case you want to run Masq2 as a standalone application (not integrated into an existing app), you will have to generate a bare-bone Rails app first:
    * `rails new my_openid_provider`

2. Add `masq2` to your Gemfile and install it:
    * `gem 'masq2'`
    * `bundle install`

3. Copy the configuration and edit it:
    * `bundle exec rake masq:install:config`
    * `$EDITOR config/masq.yml`

4. Copy the migrations and migrate:
    * `bundle exec rake masq:install:migrations`
    * `bundle exec rake db:migrate`

5. Configure the routes by mounting the masq engine:
    * For integration into an existing app, mount it in a subdirectory, like:
        * `mount Masq::Engine => "/masq"` or
        * `mount Masq::Engine => "/openid"`
    * Standalone installation, mount it at the root:
        * `mount Masq::Engine => "/"`

## Testing the installation

You can test the functionality in your local environment starting two instances: One as
your Identity Provider/OpenID Server and another one as Relying Party.

    * `rails server`
    * `rails server -p 3001`

Open your browser with these urls (assumes you mounted the engine at */masq*):

    * [http://localhost:3000/masq](http://localhost:3000/masq) (Identity Provider)
    * [http://localhost:3001/masq/consumer](http://localhost:3001/masq/consumer) (Relying Party testsuite)

First you have to create an account at the Identity Provider, after that you will be able
to use the issued OpenID URL (`http://localhost:3000/masq/YOUR_LOGIN`) to send requests from the
Relying Party to the server.

Use the options provided by the OpenID verification form to test several aspects of the
client-server communication (like requesting simple registration data).

## Development

### Introduction

`masq2` adds ORACLE database support, as well as support for
Rails 5.2, 6.0, 6.1, 7.0, 7.1, 7.2, 8.0,
which `masq` never had.

The main functionality is in the server controller, which is the endpoint for incoming
OpenID requests. The server controller is supposed to only interact with relying parties
a.k.a. consumer websites. It includes the OpenidServerSystem module, which provides some
handy methods to access and answer OpenID requests.

#### v1 Release Breaking Change

\[📒Also Rails 5.2+ / Serialization / Psych Caveats\]

v1 release has a breaking change from the ancient masq v0.3.4 release.
Continue reading if you think it may impact you.

Rails 5.2.8.1 is a security patch release to fix CVE-2022-32224.
See: https://discuss.rubyonrails.org/t/cve-2022-32224-possible-rce-escalation-bug-with-serialized-columns-in-active-record/81017

The patch (Rails v5.2.8.1) causes an error with `masq` v0.3.4
(... actually it doesn't work at all on Rails v5, but some forks have been fixed):

```
Psych::DisallowedClass: Tried to load unspecified class: ActiveSupport::HashWithIndifferentAccess
```

when serializing a Hash the way we had done in previous versions `app/models/masq/open_id_request.rb`:
```ruby
serialize :parameters, Hash
```

so we instead switch to serializing as JSON:
```ruby
# Rails 5.2/6.0
serialize :parameters, JSON
# Rails 6.1+
serialize :parameters, type: Hash, coder: JSON
```

If an implementation needs to continue using the serialized Hash,
you will need to override the definition by reopening the model,
and set it back to the old way!

```ruby
# Rails 5.2/6.0
serialize :parameters, Hash
# Rails 6.1+ (untested, might not work!)
serialize :parameters, type: Hash, coder: Hash
```

In addition, one of the following is also needed.

1. Simple, but insecure fix, which reverts to previous unpatched behavior is:

      ```ruby
Rails.application.config.active_record.use_yaml_unsafe_load = true
      ```

2. More complex, and a bit less insecure fix, is to explicitly list the allowed classes to serialize:

      ```ruby
Rails.application.config.active_record.yaml_column_permitted_classes = [Symbol, Date, Time, HashWithIndifferentAccess]
      ```

### Testing

You can run the tests with Rake:

* `DB_ADAPTER=sqlite3 bundle exec rake app:masq:test:ci`
* `DB_ADAPTER=mysql2 bundle exec rake app:masq:test:ci`
* `DB_ADAPTER=postgresql bundle exec rake app:masq:test:ci`

The Rake task configures the database.yml for the chosen adapter.

In case you prefer running the tests continuously, use Guard:

* `bundle exec guard`

## 🔐 Security

See [SECURITY.md][🔐security].

## 🤝 Contributing

If you need some ideas of where to help, you could work on adding more code coverage,
or if it is already 💯 (see [below](#code-coverage)) check TODOs (see [below](#todos)),
or check [issues][🤝issues], or [PRs][🤝pulls],
or use the gem and think about how it could be better.

We [![Keep A Changelog][📗keep-changelog-img]][📗keep-changelog] so if you make changes, remember to update it.

See [CONTRIBUTING.md][🤝contributing] for more detailed instructions.

### Code Coverage

[![Coverage Graph][🔑codecov-g♻️]][🔑codecov]

### 🪇 Code of Conduct

Everyone interacting in this project's codebases, issue trackers,
chat rooms and mailing lists is expected to follow the [![Contributor Covenant 2.1][🪇conduct-img]][🪇conduct].

## 🌈 Contributors

[![Contributors][🖐contributors-img]][🖐contributors]

Made with [contributors-img][🖐contrib-rocks].

Also see GitLab Contributors: [https://gitlab.com/oauth-xx/masq2/-/graphs/main][🚎contributors-gl]

## ⭐️ Star History

<a href="https://star-history.com/#oauth-xx/masq2&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=oauth-xx/masq2&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=oauth-xx/masq2&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=oauth-xx/masq2&type=Date" />
 </picture>
</a>

## 📌 Versioning

This Library adheres to [![Semantic Versioning 2.0.0][📌semver-img]][📌semver].
Violations of this scheme should be reported as bugs.
Specifically, if a minor or patch version is released that breaks backward compatibility,
a new version should be immediately released that restores compatibility.
Breaking changes to the public API will only be introduced with new major versions.

### 📌 Is "Platform Support" part of the public API?

Yes.  But I'm obligated to include notes...

SemVer should, but doesn't explicitly, say that dropping support for specific Platforms
is a *breaking change* to an API.
It is obvious to many, but not all, and since the spec is silent, the bike shedding is endless.

> dropping support for a platform is both obviously and objectively a breaking change

- Jordan Harband (@ljharb) [in SemVer issue 716][📌semver-breaking]

To get a better understanding of how SemVer is intended to work over a project's lifetime,
read this article from the creator of SemVer:

- ["Major Version Numbers are Not Sacred"][📌major-versions-not-sacred]

As a result of this policy, and the interpretive lens used by the maintainer,
you can (and should) specify a dependency on these libraries using
the [Pessimistic Version Constraint][📌pvc] with two digits of precision.

For example:

```ruby
spec.add_dependency("masq2", "~> 1.0")
```

See [CHANGELOG.md][📌changelog] for list of releases.

## 📄 License

The gem is available as open source under the terms of
the [MIT License][📄license] [![License: MIT][📄license-img]][📄license-ref].
See [LICENSE.txt][📄license] for the official [Copyright Notice][📄copyright-notice-explainer].

### © Copyright

<p>
  Copyright (c) 2024 - 2025 Peter H. Boling,
  <a href="https://railsbling.com">
    RailsBling.com
    <picture>
      <img alt="Rails Bling" height="20" src="https://railsbling.com/images/logos/RailsBling-TrainLogo.svg" />
    </picture>
  </a>
</p>

## 🤑 One more thing

You made it to the bottom of the page,
so perhaps you'll indulge me for another 20 seconds.
I maintain many dozens of gems, including this one,
because I want Ruby to be a great place for people to solve problems, big and small.
Please consider supporting my efforts via the giant yellow link below,
or one of the others at the head of this README.

[![Buy me a latte][🖇buyme-img]][🖇buyme]

[✇bundle-group-pattern]: https://gist.github.com/pboling/4564780
[⛳️gem-namespace]: https://github.com/oauth-xx/masq2/blob/main/lib/masq.rb
[⛳️namespace-img]: https://img.shields.io/badge/namespace-Masq-brightgreen.svg?style=flat&logo=ruby&logoColor=white
[⛳️gem-name]: https://rubygems.org/gems/masq2
[⛳️name-img]: https://img.shields.io/badge/name-masq2-brightgreen.svg?style=flat&logo=rubygems&logoColor=red
[🚂bdfl-blog]: http://www.railsbling.com/tags/masq2
[🚂bdfl-blog-img]: https://img.shields.io/badge/blog-railsbling-0093D0.svg?style=for-the-badge&logo=rubyonrails&logoColor=orange
[🚂bdfl-contact]: http://www.railsbling.com/contact
[🚂bdfl-contact-img]: https://img.shields.io/badge/Contact-BDFL-0093D0.svg?style=flat&logo=rubyonrails&logoColor=red
[💖🖇linkedin]: http://www.linkedin.com/in/peterboling
[💖🖇linkedin-img]: https://img.shields.io/badge/PeterBoling-LinkedIn-0B66C2?style=flat&logo=newjapanprowrestling
[💖✌️wellfound]: https://angel.co/u/peter-boling
[💖✌️wellfound-img]: https://img.shields.io/badge/peter--boling-orange?style=flat&logo=wellfound
[💖💲crunchbase]: https://www.crunchbase.com/person/peter-boling
[💖💲crunchbase-img]: https://img.shields.io/badge/peter--boling-purple?style=flat&logo=crunchbase
[💖🐘ruby-mast]: https://ruby.social/@galtzo
[💖🐘ruby-mast-img]: https://img.shields.io/mastodon/follow/109447111526622197?domain=https%3A%2F%2Fruby.social&style=flat&logo=mastodon&label=Ruby%20%40galtzo
[💖🦋bluesky]: https://galtzo.bsky.social
[💖🦋bluesky-img]: https://img.shields.io/badge/@galtzo.bsky.social-0285FF?style=flat&logo=bluesky&logoColor=white
[💖🌳linktree]: https://linktr.ee/galtzo
[💖🌳linktree-img]: https://img.shields.io/badge/galtzo-purple?style=flat&logo=linktree
[💖💁🏼‍♂️devto]: https://dev.to/galtzo
[💖💁🏼‍♂️devto-img]: https://img.shields.io/badge/dev.to-0A0A0A?style=flat&logo=devdotto&logoColor=white
[💖💁🏼‍♂️aboutme]: https://about.me/peter.boling
[💖💁🏼‍♂️aboutme-img]: https://img.shields.io/badge/about.me-0A0A0A?style=flat&logo=aboutme&logoColor=white
[👨🏼‍🏫expsup-upwork]: https://www.upwork.com/freelancers/~014942e9b056abdf86?mp_source=share
[👨🏼‍🏫expsup-upwork-img]: https://img.shields.io/badge/UpWork-13544E?style=for-the-badge&logo=Upwork&logoColor=white
[👨🏼‍🏫expsup-codementor]: https://www.codementor.io/peterboling?utm_source=github&utm_medium=button&utm_term=peterboling&utm_campaign=github
[👨🏼‍🏫expsup-codementor-img]: https://img.shields.io/badge/CodeMentor-Get_Help-1abc9c?style=for-the-badge&logo=CodeMentor&logoColor=white
[🏙️entsup-tidelift]: https://tidelift.com/subscription
[🏙️entsup-tidelift-img]: https://img.shields.io/badge/Tidelift_and_Sonar-Enterprise_Support-FD3456?style=for-the-badge&logo=sonar&logoColor=white
[🏙️entsup-tidelift-sonar]: https://blog.tidelift.com/tidelift-joins-sonar
[💁🏼‍♂️peterboling]: http://www.peterboling.com
[🚂railsbling]: http://www.railsbling.com
[📜src-gl-img]: https://img.shields.io/badge/GitLab-FBA326?style=for-the-badge&logo=Gitlab&logoColor=orange
[📜src-gl]: https://gitlab.com/oauth-xx/masq2/
[📜src-gh-img]: https://img.shields.io/badge/GitHub-238636?style=for-the-badge&logo=Github&logoColor=green
[📜src-gh]: https://github.com/oauth-xx/masq2
[📜docs-cr-rd-img]: https://img.shields.io/badge/RubyDoc-Current_Release-943CD2?style=for-the-badge&logo=readthedocs&logoColor=white
[📜docs-head-rd-img]: https://img.shields.io/badge/RubyDoc-HEAD-943CD2?style=for-the-badge&logo=readthedocs&logoColor=white
[📜wiki]: https://gitlab.com/oauth-xx/masq2/-/wikis/home
[📜wiki-img]: https://img.shields.io/badge/wiki-examples-943CD2.svg?style=for-the-badge&logo=Wiki&logoColor=white
[👽dl-rank]: https://rubygems.org/gems/masq2
[👽dl-ranki]: https://img.shields.io/gem/rd/masq2.svg
[👽oss-help]: https://www.codetriage.com/oauth-xx/masq2
[👽oss-helpi]: https://www.codetriage.com/oauth-xx/masq2/badges/users.svg
[👽version]: https://rubygems.org/gems/masq2
[👽versioni]: https://img.shields.io/gem/v/masq2.svg
[🔑cc-mnt]: https://qlty.sh/gh/oauth-xx/projects/masq2
[🔑cc-mnti♻️]: https://qlty.sh/badges/018b561f-0b1d-478b-910e-5133f71fd973/maintainability.svg
[🔑cc-cov]: https://qlty.sh/gh/oauth-xx/projects/masq2
[🔑cc-covi♻️]: https://qlty.sh/badges/018b561f-0b1d-478b-910e-5133f71fd973/test_coverage.svg
[🔑codecov]: https://codecov.io/gh/oauth-xx/masq2
[🔑codecovi♻️]: https://codecov.io/gh/oauth-xx/masq2/branch/main/graph/badge.svg?token=xqVPZjg76X
[🔑coveralls]: https://coveralls.io/github/oauth-xx/masq2?branch=main
[🔑coveralls-img]: https://coveralls.io/repos/github/oauth-xx/masq2/badge.svg?branch=main
[🔑depfu]: https://depfu.com/github/oauth-xx/masq2
[🔑depfui♻️]: https://badges.depfu.com/badges/85187dfdd2ecf7839b2ec78c64d2bf4e/count.svg
[🖐codeQL]: https://github.com/oauth-xx/masq2/security/code-scanning
[🖐codeQL-img]: https://github.com/oauth-xx/masq2/actions/workflows/codeql-analysis.yml/badge.svg
[🚎1-an-wf]: https://github.com/oauth-xx/masq2/actions/workflows/ancient.yml
[🚎1-an-wfi]: https://github.com/oauth-xx/masq2/actions/workflows/ancient.yml/badge.svg
[🚎2-cov-wf]: https://github.com/oauth-xx/masq2/actions/workflows/coverage.yml
[🚎2-cov-wfi]: https://github.com/oauth-xx/masq2/actions/workflows/coverage.yml/badge.svg
[🚎3-hd-wf]: https://github.com/oauth-xx/masq2/actions/workflows/heads.yml
[🚎3-hd-wfi]: https://github.com/oauth-xx/masq2/actions/workflows/heads.yml/badge.svg
[🚎4-lg-wf]: https://github.com/oauth-xx/masq2/actions/workflows/legacy.yml
[🚎4-lg-wfi]: https://github.com/oauth-xx/masq2/actions/workflows/legacy.yml/badge.svg
[🚎5-st-wf]: https://github.com/oauth-xx/masq2/actions/workflows/style.yml
[🚎5-st-wfi]: https://github.com/oauth-xx/masq2/actions/workflows/style.yml/badge.svg
[🚎6-s-wf]: https://github.com/oauth-xx/masq2/actions/workflows/supported.yml
[🚎6-s-wfi]: https://github.com/oauth-xx/masq2/actions/workflows/supported.yml/badge.svg
[🚎7-us-wf]: https://github.com/oauth-xx/masq2/actions/workflows/unsupported.yml
[🚎7-us-wfi]: https://github.com/oauth-xx/masq2/actions/workflows/unsupported.yml/badge.svg
[🚎8-ho-wf]: https://github.com/oauth-xx/masq2/actions/workflows/hoary.yml
[🚎8-ho-wfi]: https://github.com/oauth-xx/masq2/actions/workflows/hoary.yml/badge.svg
[🚎11-c-wf]: https://github.com/oauth-xx/masq2/actions/workflows/current.yml
[🚎11-c-wfi]: https://github.com/oauth-xx/masq2/actions/workflows/current.yml/badge.svg
[⛳liberapay-img]: https://img.shields.io/liberapay/patrons/pboling.svg?logo=liberapay
[⛳liberapay]: https://liberapay.com/pboling/donate
[🖇sponsor-img]: https://img.shields.io/badge/Sponsor_Me!-pboling.svg?style=social&logo=github
[🖇sponsor]: https://github.com/sponsors/pboling
[🖇polar-img]: https://polar.sh/embed/seeks-funding-shield.svg?org=pboling
[🖇polar]: https://polar.sh/pboling
[🖇kofi-img]: https://img.shields.io/badge/buy_me_coffee-donate-yellow.svg
[🖇kofi]: https://ko-fi.com/O5O86SNP4
[🖇patreon-img]: https://img.shields.io/badge/patreon-donate-yellow.svg
[🖇patreon]: https://patreon.com/galtzo
[💎ruby-2.7i]: https://img.shields.io/badge/Ruby-2.7-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.0i]: https://img.shields.io/badge/Ruby-3.0-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.1i]: https://img.shields.io/badge/Ruby-3.1-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.2i]: https://img.shields.io/badge/Ruby-3.2-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.3i]: https://img.shields.io/badge/Ruby-3.3-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-c-i]: https://img.shields.io/badge/Ruby-current-CC342D?style=for-the-badge&logo=ruby&logoColor=green
[💎ruby-headi]: https://img.shields.io/badge/Ruby-HEAD-CC342D?style=for-the-badge&logo=ruby&logoColor=blue
[🤝issues]: https://github.com/oauth-xx/masq2/issues
[🤝pulls]: https://github.com/oauth-xx/masq2/pulls
[🤝contributing]: CONTRIBUTING.md
[🔑codecov-g♻️]: https://codecov.io/gh/oauth-xx/masq2/graphs/tree.svg?token=xqVPZjg76X
[🖐contrib-rocks]: https://contrib.rocks
[🖐contributors]: https://github.com/oauth-xx/masq2/graphs/contributors
[🖐contributors-img]: https://contrib.rocks/image?repo=oauth-xx/masq2
[🚎contributors-gl]: https://gitlab.com/oauth-xx/masq2/-/graphs/main
[🪇conduct]: CODE_OF_CONDUCT.md
[🪇conduct-img]: https://img.shields.io/badge/Contributor_Covenant-2.1-4baaaa.svg
[📌pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint
[📌semver]: https://semver.org/spec/v2.0.0.html
[📌semver-img]: https://img.shields.io/badge/semver-2.0.0-FFDD67.svg?style=flat
[📌semver-breaking]: https://github.com/semver/semver/issues/716#issuecomment-869336139
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📌changelog]: CHANGELOG.md
[📗keep-changelog]: https://keepachangelog.com/en/1.0.0/
[📗keep-changelog-img]: https://img.shields.io/badge/keep--a--changelog-1.0.0-FFDD67.svg?style=flat
[🧮kloc]: https://www.youtube.com/watch?v=dQw4w9WgXcQ
[🧮kloc-img]: https://img.shields.io/badge/KLOC-0.075-FFDD67.svg?style=for-the-badge&logo=YouTube&logoColor=blue
[🔐security]: SECURITY.md
[🔐security-img]: https://img.shields.io/badge/security-policy-brightgreen.svg?style=flat
[📄copyright-notice-explainer]: https://opensource.stackexchange.com/questions/5778/why-do-licenses-such-as-the-mit-license-specify-a-single-year
[📄license]: LICENSE.txt
[📄license-ref]: https://opensource.org/licenses/MIT
[📄license-img]: https://img.shields.io/badge/License-MIT-green.svg
[📄ilo-declaration]: https://www.ilo.org/declaration/lang--en/index.htm
[📄ilo-declaration-img]: https://img.shields.io/badge/ILO_Fundamental_Principles-✓-brightgreen.svg?style=flat
[🚎yard-current]: http://rubydoc.info/gems/masq2
[🚎yard-head]: https://rubydoc.info/github/oauth-xx/masq2/main
[🖇buyme-img]: https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20latte&emoji=&slug=pboling&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff
[🖇buyme]: https://www.buymeacoffee.com/pboling
[🖇buyme-small-img]: https://img.shields.io/badge/Buy--Me--A--Coffee-✓-brightgreen.svg?style=flat
