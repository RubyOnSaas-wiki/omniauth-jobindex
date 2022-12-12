# frozen_string_literal: true

require 'omniauth/strategies/oauth2'
#require 'uri'

module OmniAuth
  module Strategies

    # Jobindex OAuth2 strategy
    class Jobindex < OmniAuth::Strategies::OAuth2
      option :name, 'jobindex'
      option :scope, 'get_oca_cv'

      option :client_options,
             site: 'https://www.jobindex.dk/',
             authorize_url: '/api/OCA/v1/authorize',
             token_url: '/api/OCA/v1/token'

      uid { raw_info['email'] }

      info do
        {
          first_name: raw_info['first_name'],
          middle_name: raw_info['middle_name'],
          last_name: raw_info['last_name'],
          email: raw_info['email'],
          address: raw_info['address'],
          zipcode: raw_info['zipcode'],
          city: raw_info['city'],
          phonenumber: raw_info['phonenumber'],
          sex: raw_info['sex'],
          birthdate: raw_info['birthdate'],
          latest_company: raw_info['latest_company'],
          education_title: raw_info['education_title'],
          education_level: raw_info['education_level'],
          handicap: raw_info['handicap'],
          cv: {
            filename: raw_info.dig('cv', 'filename'),
            filetype: raw_info.dig('cv', 'filetype'),
            content: raw_info.dig('cv', 'content'),
          }
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def build_access_token
        verifier = request.params['code']
        state = request.params['state']
        client.auth_code.get_token(verifier,
          {redirect_uri: callback_url.to_s.split('?').first,
           state: state}.merge(token_params.to_hash(symbolize_keys: true)),
          deep_symbolize(options.auth_token_params))
      end

      def raw_info
        return @raw_info if @raw_info.present?
        raw_response = client.request(:post, 'https://www.jobindex.dk/api/OCA/v1/get_userdata',
                                      params: { access_token: access_token.token }).parsed
        @raw_info = raw_response
      end
    end
  end
end
