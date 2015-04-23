{- Copyright © 2015 Benjamin Barenblat

Licensed under the Apache License, Version 2.0 (the ‘License’); you may not use
this file except in compliance with the License.  You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an ‘AS IS’ BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied.  See the License for the
specific language governing permissions and limitations under the License. -}

module B.Prelude.Maybe where

import Data.Maybe

open Data.Maybe
  using (Maybe; just; nothing; maybe; maybe′)
  public

module Maybe where
  open Data.Maybe
    using (from-just; is-just; is-nothing)
    public
