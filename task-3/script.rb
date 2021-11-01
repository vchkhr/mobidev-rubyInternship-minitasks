class MDHtml
    def initialize(&block)
        @html
        instance_eval &block
    end

    def html(&block)
        @html = {}
        instance_eval &block
    end

    ["head", "body"].each do |element|
        define_method("#{element}") do |&block|
            @html[element.to_sym] = []
            instance_eval &block
        end
    end

    def div(&block)
        @html[:body] << ["div", [block.call()]]
    end

    [
        {tag: "meta", attribute: true, parent: "head"}, 
        {tag: "link", attribute: true, parent: "head"},
        {tag: "title", attribute: false, parent: "head"},
        {tag: "script", attribute: true, parent: "body"}
    ].each do |element|
        if element[:attribute] == false
            define_method("#{element[:tag]}") do |*content|
                @html[element[:parent].to_sym] << ["#{element[:tag]}", content]
            end
        else
            define_method("#{element[:tag]}") do |**content|
                @html[element[:parent].to_sym] << ["#{element[:tag]}", content]
            end
        end
    end

    def to_s
        html_s = ''

        if @html.class == Hash
            html_s << "<!doctype html>\n\n<html>\n"
        end

        if @html.key?(:head)
            html_s << "<head>\n"

            @html[:head].each do |element|
                if element[0] != "meta"
                    html_s << "\n"
                end

                if element[1].class == Array
                    html_s << "\t<#{element[0]}>#{element[1][0]}<#{element[0]}> \n"
                else
                    if element[0] == "meta"
                        if element[1].keys[0].to_s == "charset"
                            html_s << "\t<#{element[0]} #{element[1].keys[0]}=\"#{element[1].values[0]}\"> \n"
                        else
                            html_s << "\t<#{element[0]} name=\"#{element[1].keys[0]}\" content=\"#{element[1].values[0]}\"> \n"
                        end
                    elsif element[0] == "link"
                        html_s << "\t<#{element[0]} reh=\"stylesheet\" rel=\"#{element[1].keys[0]}=\"#{element[1].values[0]}\"> \n"
                    end
                end
            end

            html_s << "</head>\n"
        end

        if @html.key?(:body)
            html_s << "\n<body>\n"

            @html[:body].each do |element|
                if element[0] == "div"
                    html_s << "\t<#{element[0]}>#{element[1][0]}</#{element[0]}>\n"
                else
                    html_s << "\t<#{element[0]} #{element[1].keys[0]}=\"#{element[1].values[0]}\"></#{element[0]}>\n"
                end
            end

            html_s << "</body>\n"
        end


        if @html.class == Hash
            html_s << "</html>"
        end

        puts html_s
    end
end

MDHtml.new do
    html do
        head do
            meta charset: "utf-8"
            title "The HTML5 Template"
            meta description: "The HTML5 Template"
            meta author: "MobiDev"
            link stylesheet: "css/styles.css?v=1.0"
        end

        body do
            div do
                "Hello World"
            end
            script src:"js/scripts.js"
        end
    end
end.to_s
