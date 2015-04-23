B: A New Way of Looking at the Agda Standard Library
====================================================

B (as in ‘Plan B’) is an compatible extension of the [Agda standard library][]
intended to support general programming with dependent types.  Its goal is to
eliminate the large numbers of imports common in Agda programs through universal
use of type classes and pre-imported names.

B fulfils a different role than the [Agda Prelude][].  The Agda Prelude is a
fully-featured standard library alternative, but it comes at the expense of
compatibility.  The Prelude is also heavily programming-oriented, disabling the
termination checker when appropriate.  B, on the other hand, takes a more
general route: it is much smaller, makes only compatible extensions to the
standard library, and it avoids turning off the termination checker.

Getting started
---------------

B is probably not yet ready for general use.  However, if you’d like to try it,
you should probably use [Agda][] v2.4.2.2 and version 0.9 of the standard
library.

Copyright and licence
---------------------

B is copyright © 2015 [Benjamin Barenblat][] and licensed under the
[Apache License, version 2.0] [Apache License].  Unless required by applicable
law or agreed to in writing, B is distributed on an _‘as is’ basis, without
warranties or conditions of any kind_, either express or implied.  See the
License for the specific language governing permissions and limitations under
the License.

[Agda]: http://wiki.portal.chalmers.se/agda/
[Agda Prelude]: https://github.com/UlfNorell/agda-prelude
[Agda standard library]: http://wiki.portal.chalmers.se/agda/pmwiki.php?n=Libraries.StandardLibrary
[Apache License]: http://www.apache.org/licenses/LICENSE-2.0
[Benjamin Barenblat]: https://benjamin.barenblat.name/
