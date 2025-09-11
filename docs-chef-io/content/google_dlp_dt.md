+++
title = "google_dlp_dt resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dlp_dt"
identifier = "inspec/resources/gcp/google_dlp_dt resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dlp_dt` InSpec audit resource to to test a Google Cloud DT resource.

## Examples

```ruby


describe google_dlp_dts(parent: "projects/#{'chef-gcp-inspec'}/locations/#{''}") do
  it { should exist }
  its('display_names') { should include '' }
end

```

## Properties

Properties that can be accessed from the `google_dlp_dt` resource:


  * `name`: The resource name of the template. Set by the server.

  * `description`: A description of the template.

  * `display_name`: User set display name of the template.

  * `config`: deidentifyConfig - Configuration of the deidentify template

    * `info_type_tf`: infoTypeTransformations - Specifies free-text based transformations to be applied to the dataset.

      * `tf`: transformations - Transformation for each infoType. Cannot specify more than one for a given infoType.

        * `info_types`: InfoTypes to apply the transformation to. Leaving this empty will apply the transformation to apply to all findings that correspond to infoTypes that were requested in InspectConfig.

          * `name`: Name of the information type.

        * `primitive_tf`: Primitive transformation to apply to the infoType.

          * `replace_config`: Replace each input value with a given value.

            * `new_value`: Replace each input value with a given value.

              * `integer_value`: An integer value.

              * `float_value`: A float value.

              * `string_value`: A string value.

              * `boolean_value`: A boolean value.

              * `timestamp_value`: A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

              * `time_value`: Represents a time of day.

                * `hours`: Hours of day in 24 hour format. Should be from 0 to 23.

                * `minutes`: Minutes of hour of day. Must be from 0 to 59.

                * `seconds`: Seconds of minutes of the time. Must normally be from 0 to 59.

                * `nanos`: Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.

              * `date_value`: Represents a whole or partial calendar date.

                * `year`: Year of date. Must be from 1 to 9999, or 0 if specifying a date without a year.

                * `month`: Month of year. Must be from 1 to 12, or 0 if specifying a year without a month and day.

                * `day`: Day of month. Must be from 1 to 31 and valid for the year and month, or 0 if specifying a year by itself or a year and month where the day is not significant.

              * `day_of_week_value`: Represents a day of the week.
              Possible values:
                * MONDAY
                * TUESDAY
                * WEDNESDAY
                * THURSDAY
                * FRIDAY
                * SATURDAY
                * SUNDAY

          * `replace_with_info_type_config`: Replace each matching finding with the name of the info type.

          * `character_mask_config`: Partially mask a string by replacing a given number of characters with a fixed character. Masking can start from the beginning or end of the string.

            * `masking_character`: Character to use to mask the sensitive values—for example, * for an alphabetic string such as a name, or 0 for a numeric string such as ZIP code or credit card number. This string must have a length of 1. If not supplied, this value defaults to * for strings, and 0 for digits.

            * `number_to_mask`: Number of characters to mask. If not set, all matching chars will be masked. Skipped characters do not count towards this tally.

            * `reverse_order`: Mask characters in reverse order. For example, if masking_character is 0, number_to_mask is 14, and reverse_order is `false`, then the input string `1234-5678-9012-3456` is masked as `00000000000000-3456`.

            * `characters_to_ignore`: Characters to skip when doing de-identification of a value. These will be left alone and skipped.

              * `characters_to_skip`: Characters to not transform when masking.

              * `common_characters_to_ignore`: Common characters to not transform when masking. Useful to avoid removing punctuation.
              Possible values:
                * NUMERIC
                * ALPHA_UPPER_CASE
                * ALPHA_LOWER_CASE
                * PUNCTUATION
                * WHITESPACE

          * `crypto_deterministic_config`: Pseudonymization method that generates deterministic encryption for the given input. Outputs a base64 encoded representation of the encrypted output. Uses AES-SIV based on the RFC [https://tools.ietf.org/html/rfc5297](https://tools.ietf.org/html/rfc5297).

            * `crypto_key`: The key used by the encryption function.

              * `transient`: Transient crypto key

                * `name`: Name of the key. This is an arbitrary string used to differentiate different keys. A unique key is generated per name: two separate `TransientCryptoKey` protos share the same generated key if their names are the same. When the data crypto key is generated, this name is not used in any way (repeating the api call will result in a different key being generated).

              * `unwrapped`: Unwrapped crypto key

                * `key`: A 128/192/256 bit key.  A base64-encoded string.

              * `kms_wrapped`: Kms wrapped key

                * `wrapped_key`: The wrapped data crypto key.  A base64-encoded string.

                * `crypto_key_name`: The resource name of the KMS CryptoKey to use for unwrapping.

            * `surrogate_info_type`: The custom info type to annotate the surrogate with. This annotation will be applied to the surrogate by prefixing it with the name of the custom info type followed by the number of characters comprising the surrogate. The following scheme defines the format: {info type name}({surrogate character count}):{surrogate}  For example, if the name of custom info type is 'MY\_TOKEN\_INFO\_TYPE' and the surrogate is 'abc', the full replacement value will be: 'MY\_TOKEN\_INFO\_TYPE(3):abc'  This annotation identifies the surrogate when inspecting content using the custom info type 'Surrogate'. This facilitates reversal of the surrogate when it occurs in free text.  Note: For record transformations where the entire cell in a table is being transformed, surrogates are not mandatory. Surrogates are used to denote the location of the token and are necessary for re-identification in free form text.  In order for inspection to work properly, the name of this info type must not occur naturally anywhere in your data; otherwise, inspection may either  *   reverse a surrogate that does not correspond to an actual identifier *   be unable to parse the surrogate and result in an error  Therefore, choose your custom info type name carefully after considering what your data looks like. One way to select a name that has a high chance of yielding reliable detection is to include one or more unicode characters that are highly improbable to exist in your data. For example, assuming your data is entered from a regular ASCII keyboard, the symbol with the hex code point 29DD might be used like so: ⧝MY\_TOKEN\_TYPE.

              * `name`: Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at [https://cloud.google.com/dlp/docs/infotypes-reference](https://cloud.google.com/dlp/docs/infotypes-reference) when specifying a built-in type. When sending Cloud DLP results to Data Catalog, infoType names should conform to the pattern `[A-Za-z0-9$-_]{1,64}`.

            * `context`: A context may be used for higher security and maintaining referential integrity such that the same identifier in two different contexts will be given a distinct surrogate. The context is appended to plaintext value being encrypted. On decryption the provided context is validated against the value used during encryption. If a context was provided during encryption, same context must be provided during decryption as well.  If the context is not set, plaintext would be used as is for encryption. If the context is set but:  1.  there is no record present when transforming a given value or 2.  the field is not present when transforming a given value,  plaintext would be used as is for encryption.  Note that case (1) is expected when an `InfoTypeTransformation` is applied to both structured and non-structured `ContentItem`s.

              * `name`: Name describing the field.

          * `crypto_replace_ffx_fpe_config`: Replaces an identifier with a surrogate using Format Preserving Encryption (FPE) with the FFX mode of operation; however when used in the `content.reidentify` API method, it serves the opposite function by reversing the surrogate back into the original identifier. The identifier must be encoded as ASCII. For a given crypto key and context, the same identifier will be replaced with the same surrogate. Identifiers must be at least two characters long. In the case that the identifier is the empty string, it will be skipped. See [https://cloud.google.com/dlp/docs/pseudonymization](https://cloud.google.com/dlp/docs/pseudonymization) to learn more.  Note: We recommend using CryptoDeterministicConfig for all use cases which do not require preserving the input alphabet space and size, plus warrant referential integrity.

            * `crypto_key`: The key used by the encryption algorithm.

              * `transient`: Transient crypto key

                * `name`: Name of the key. This is an arbitrary string used to differentiate different keys. A unique key is generated per name: two separate `TransientCryptoKey` protos share the same generated key if their names are the same. When the data crypto key is generated, this name is not used in any way (repeating the api call will result in a different key being generated).

              * `unwrapped`: Unwrapped crypto key

                * `key`: A 128/192/256 bit key.  A base64-encoded string.

              * `kms_wrapped`: Kms wrapped key

                * `wrapped_key`: The wrapped data crypto key.  A base64-encoded string.

                * `crypto_key_name`: The resource name of the KMS CryptoKey to use for unwrapping.

            * `context`: The 'tweak', a context may be used for higher security since the same identifier in two different contexts won't be given the same surrogate. If the context is not set, a default tweak will be used.  If the context is set but:  1.  there is no record present when transforming a given value or 2.  the field is not present when transforming a given value,  a default tweak will be used.  Note that case (1) is expected when an `InfoTypeTransformation` is applied to both structured and non-structured `ContentItem`s. Currently, the referenced field may be of value type integer or string.  The tweak is constructed as a sequence of bytes in big endian byte order such that:  *   a 64 bit integer is encoded followed by a single byte of value 1 *   a string is encoded in UTF-8 format followed by a single byte of value 2

              * `name`: Name describing the field.

            * `surrogate_info_type`: The custom infoType to annotate the surrogate with. This annotation will be applied to the surrogate by prefixing it with the name of the custom infoType followed by the number of characters comprising the surrogate. The following scheme defines the format: info\_type\_name(surrogate\_character\_count):surrogate  For example, if the name of custom infoType is 'MY\_TOKEN\_INFO\_TYPE' and the surrogate is 'abc', the full replacement value will be: 'MY\_TOKEN\_INFO\_TYPE(3):abc'  This annotation identifies the surrogate when inspecting content using the custom infoType [`SurrogateType`](https://cloud.google.com/dlp/docs/reference/rest/v2/InspectConfig#surrogatetype). This facilitates reversal of the surrogate when it occurs in free text.  In order for inspection to work properly, the name of this infoType must not occur naturally anywhere in your data; otherwise, inspection may find a surrogate that does not correspond to an actual identifier. Therefore, choose your custom infoType name carefully after considering what your data looks like. One way to select a name that has a high chance of yielding reliable detection is to include one or more unicode characters that are highly improbable to exist in your data. For example, assuming your data is entered from a regular ASCII keyboard, the symbol with the hex code point 29DD might be used like so: ⧝MY\_TOKEN\_TYPE

              * `name`: Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at [https://cloud.google.com/dlp/docs/infotypes-reference](https://cloud.google.com/dlp/docs/infotypes-reference) when specifying a built-in type. When sending Cloud DLP results to Data Catalog, infoType names should conform to the pattern `[A-Za-z0-9$-_]{1,64}`.

            * `common_alphabet`: Common alphabets.
            Possible values:
              * FFX_COMMON_NATIVE_ALPHABET_UNSPECIFIED
              * NUMERIC
              * HEXADECIMAL
              * UPPER_CASE_ALPHA_NUMERIC
              * ALPHA_NUMERIC

            * `custom_alphabet`: This is supported by mapping these to the alphanumeric characters that the FFX mode natively supports. This happens before/after encryption/decryption. Each character listed must appear only once. Number of characters must be in the range \[2, 95\]. This must be encoded as ASCII. The order of characters does not matter. The full list of allowed characters is:  ``0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_-+={[}]|:;"'<,>.?/``

            * `radix`: The native way to select the alphabet. Must be in the range \[2, 95\].

  * `parent`: The parent of the template in any of the following formats:  * `projects/{{project}}` * `projects/{{project}}/locations/{{location}}` * `organizations/{{organization_id}}` * `organizations/{{organization_id}}/locations/{{location}}`


## GCP permissions
