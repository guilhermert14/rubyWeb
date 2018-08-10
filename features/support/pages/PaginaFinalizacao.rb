class PaginaFinalizacao

    include RSpec::Matchers
    include Capybara::DSL

    def finalizar_pedido_responsivo_mp
        assert_selector(EL['label_numero_pedido_r'], wait: 15, visible:true)
        $numero_pedido = find(EL['label_numero_pedido_r']).text
        puts "O número do pedido é: #{$numero_pedido}"
    end

end