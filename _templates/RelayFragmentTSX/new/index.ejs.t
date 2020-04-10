---
to: app/<%=src%>/<%=name%>.tsx
---
<%
 fieldNameUpper = field.substring(0,1).toUpperCase().concat(field.substring(1))
 fieldNameLower = field.toLowerCase()
%>

import * as React from "react";
import { graphql, QueryRenderer, createFragmentContainer } from "react-relay";
import styled from "styled-components";
import createQueryRenderer from "./../relay/createQueryRenderer";

type Props = {}

const <%=Name%> = (props: Props) => {

  

  return (
    <Container>
      
    </Container>
  );
};

const FragmentContainer<%=Name%> = createFragmentContainer(<%=Name%>, {
  <%=fieldNameLower%>: graphql`
    fragment  <%=Name%>_<%=fieldNameLower%> on <%=fieldNameUpper%> @relay(plural: true) {
      _id
    }
  `
});

const <%=Name%>QueryRender = createQueryRenderer(FragmentContainer<%=Name%>, <%=Name%>, {
  query: graphql`
    query <%=Name%>Query {
      planets {
        ...<%=Name%>_<%=fieldNameLower%>
      }
    }
  `
});

export default <%=Name%>QueryRender;

const Container = styled.div`
  width: 100%;
  height: 100%;
`;


