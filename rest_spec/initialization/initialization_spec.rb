# coding: utf-8

require 'client'

describe '初期化' do
  before(:example) do
    @client = Jiji::Client.instance
  end

  context '初期化前' do
    it 'GET /setting/initialization/initialized がfalseを返す' do
      r = @client.get('/setting/initialization/initialized')
      expect(r.status).to eq 200
      expect(r.body['initialized']).to eq false
    end

    it 'PUT /setting/initialization/password で初期化できる' do
      r = @client.put('/setting/initialization/password', password: 'test')
      expect(r.status).to eq 204
    end
  end

  context '初期化後' do
    it 'GET /setting/initialization/initialized がtrueを返す' do
      r = @client.get('/setting/initialization/initialized')
      expect(r.status).to eq 200
      expect(r.body['initialized']).to eq true
    end

    it 'PUT /setting/initialization/password で再度初期化することはできない' do
      r = @client.put('/setting/initialization/password', password: 'test2')
      expect(r.status).to eq 400
    end

    it 'POST /authenticator で認証できる' do
      r = @client.post('/authenticator', password: 'test')
      expect(r.status).to eq 201

      body = r.body
      expect(body['token'].length).to be >= 0
      @client.token = body['token']
    end
  end
end
