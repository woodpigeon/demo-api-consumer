

### Making your rails app (and test) work without ActiveRecord

In ```application.rb``` remove ```require 'rails/all'``` and replace with 

```
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_model/railtie"
```

Remove ```config/database.yml```.

If using Rspec, in spec/spec_helper, comment out the line 

```
# config.use_transactional_fixtures = true
```

