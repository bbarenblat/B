{- Copyright © 2015 Benjamin Barenblat

Licensed under the Apache License, Version 2.0 (the ‘License’); you may not use
this file except in compliance with the License.  You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an ‘AS IS’ BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied.  See the License for the
specific language governing permissions and limitations under the License. -}

module B.Prelude.Sum where

import Data.Sum

open Data.Sum
  using (_⊎_; inj₁; inj₂; [_,_]; [_,_]′)
  public

module Sum where
  open Data.Sum
    using (isInj₁; isInj₂)
    public
